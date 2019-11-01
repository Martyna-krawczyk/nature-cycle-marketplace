class SizesController < ApplicationController

  load_and_authorize_resource

  def index
      @sizes = Size.all
  end

  def show

  end

  def new
    @size = Size.new
  end

  

  def create
    
    size_params
    @size = Size.new( size_params )
    if @size.save
      redirect_to @size
    end 

  end

  def edit
    
  end

  def update
    
    if @size.update( size_params )
      redirect_to @size
    else 
      render :edit
    end
  end

  def destroy
      @size.destroy
      redirect_to sizes_path
  end

  

  private

  def set_size
    id = params[ :id ]
    @size = Size.find( id )
  end


  def size_params
    params.require(:size).permit(:size)
  end
end
