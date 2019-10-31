class ColoursController < ApplicationController

  load_and_authorize_resource

  def index
      @colours = Colour.all
  end

  def show

  end

  def new
    @colour = Colour.new
  end

  

  def create
    
    colour_params
    @colour = Colour.new( colour_params )
    if @colour.save
      redirect_to @colour
    end 

  end

  def edit
    
  end

  def update
    
    if @colour.update( colour_params )
      redirect_to @colour
    else 
      render :edit
    end
  end

  def destroy
      @colour.destroy
      redirect_to colours_path
  end

  

  private

  def set_colour
    id = params[ :id ]
    @colour = Colour.find( id )
  end


  def colour_params
    params.require(:colour).permit(:colour)
  end
end
