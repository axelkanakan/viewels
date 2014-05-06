class ViewelsController < ApplicationController
  def index
  	@viewels = Viewel.all
  end

  def show
  	@viewel = Viewel.find(params[:id])
  end

  def new
     @viewel = Viewel.new
  end

  def create
    @viewel = current_user.viewels.build(params[:viewel])
    if @viewel.save
    	redirect_to @viewel, notice: 'Viewl Added Successfully!'
    else
       flash[:error] = "There was an error in adding Viewl. Please try again"
       render :new
   end
  end
end
