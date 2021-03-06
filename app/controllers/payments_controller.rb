class PaymentsController < ApplicationController
  
  skip_before_action :verify_authenticity_token, only: [ :webhook ]
  
  def success
    @listing = Listing.find(params[:listingId])
    @user = User.find(params[:userId])
    
    #This function will update the enum on the listing once a deposit is successfully made, so that only active listings are showing in index page.
    enum_change = Listing.find(params[:listingId])
    enum_change.update(sold: 'sold')
    enum_change.save
  end

  def webhook
    payment_id = params[:data] [:object] [:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    listing_id = payment.metadata.listing_id
    user_id = payment.metadata.user_id

    p "listing id = " + listing_id
    p "user id = " + user_id

    status 200
    
  end
  
end