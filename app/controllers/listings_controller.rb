class ListingsController < ApplicationController
  before_action :authenticate_user!, only:[ :show, :new] #this ensures that a visitor must login before they can view a listing, or create one
  before_action :set_listing, only: [:show,:edit, :update, :destroy]
  skip_authorize_resource :only => :show

  def index
      @listings = Listing.all
  end

  def show
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
        name: @listing.title,
        description: @listing.description,
        amount: @listing.deposit * 100,
        currency: 'aud',
        quantity: 1
      }],
      payment_intent_data: {
        metadata: {
          user_id: current_user.id,
          listing_id: @listing.id
        }
      },
      success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@listing.id}", cancel_url: "#{root_url}listings"
    )

    @session_id = session.id


  end

  def new
    @listing = Listing.new
    
  end

  

  def create
    listing_params = params.require(:listing).permit(:title, :description, :colour_id, :make_id, :size_id, :condition_id, :sold, :picture, :sex, :price, :deposit, :location)
    
    @listing = current_user.listings.create(listing_params)

    @listing.save

    if @listing.save
      redirect_to @listing
    else
      render :new
    end

  end

  def edit
    authorize! :edit, @listing
  end

  def update
    
    if @listing.update( listing_params )
      redirect_to @listing
    else 
      render :edit
    end
  end

  def destroy
      @listing.destroy
      redirect_to listings_path
  end

  def public
    
  end

  private

  def set_listing
    id = params[ :id ]
    @listing = Listing.find( id )
  end

  def set_user_listing
    id = params[:id]
    @listing = current_user.listings.find_by_id( id )

    if @listing == nil
      redirect_to listings_path
    elsif @listing.deposit == nil
      @listing.deposit = 0
    end
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :colour_id, :make_id, :size_id, :condition_id, :sold, :picture, :sex, :price, :deposit, :location)
  end


end
