class ViewelsController < ApplicationController
  def index
  	@viewels = Viewel.all
  end

  def show
  	@viewel = Viewel.find(params[:id])
    authorize! :read, @viewel, message: "You need to be premium to view this"
  end

  def new
     @viewel = Viewel.new
  end

  def create
    @viewel = current_user.viewels.build(params[:viewel])
    authorize! :create, @viewel, message: "You need to be signed up to do that."
    if @viewel.save
    	 redirect_to @viewel, notice: 'Viewl Added Successfully!'
    else
       flash[:error] = "There was an error in adding Viewl. Please try again"
       render :new
   end
  end
end
