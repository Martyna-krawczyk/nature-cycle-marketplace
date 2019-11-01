class ConditionsController < ApplicationController

  load_and_authorize_resource

  def index
      @conditions = Condition.all
  end

  def show

  end

  def new
    @condition = Condition.new
  end

  

  def create
    
    condition_params
    @condition = Condition.new( condition_params )
    if @condition.save
      redirect_to @condition
    end 

  end

  def edit
    
  end

  def update
    
    if @condition.update( condition_params )
      redirect_to @condition
    else 
      render :edit
    end
  end

  def destroy
      @condition.destroy
      redirect_to conditions_path
  end

  

  private

  def set_condition
    id = params[ :id ]
    @condition = Condition.find( id )
  end


  def condition_params
    params.require(:condition).permit(:condition)
  end
end
