class MakesController < ApplicationController

  load_and_authorize_resource

  def index
      @makes = Make.all
  end

  def show

  end

  def new
    @make = Make.new
  end

  

  def create
    
    make_params
    @make = Make.new( make_params )
    if @make.save
      redirect_to @make
    end 

  end

  def edit
    
  end

  def update
    
    if @make.update( make_params )
      redirect_to @make
    else 
      render :edit
    end
  end

  def destroy
      @make.destroy
      redirect_to makes_path
  end

  

  private

  def set_make
    id = params[ :id ]
    @make = Make.find( id )
  end


  def make_params
    params.require(:make).permit(:make)
  end
end
