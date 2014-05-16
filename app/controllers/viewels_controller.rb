class ViewelsController < ApplicationController

  #instead have the user see only there current videos

  #current_user's viewels and private videos
  #and if you are folowing a user it will be added to the public feed...
  # so current.viewels(public && private) && following user.viewels
  
  def index
    #@viewels_private = Viewel.where(private: true)
    #@viewels_public = Viewel.where(private: false)
    #@users = User.all
    #@viewels = Viewel.viewable_by(current_user)

    @viewels_public = current_user.viewels.where(private: false)
    @viewels_private = current_user.viewels.where(private: true)
   
    @users = User.all

  end

  def show
  	@viewel = Viewel.find(params[:id])
    @user= @viewel.user
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
