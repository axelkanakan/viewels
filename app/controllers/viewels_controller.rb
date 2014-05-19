class ViewelsController < ApplicationController
  
  def index
  
    #@viewels = Viewel.viewable_by(current_user)

    #@viewels_public = current_user.viewels.where(private: false)
    #@viewels_private = current_user.viewels.where(private: true)

    @my_viewels = current_user.viewels
    @my_viewels_p = current_user.viewels.where(private: true)
    @followed_viewels = current_user.followed_viewels.where(private: false)
    @users = User.where("id !=?", current_user.id)

  end

  def personal
    @my_viewels = current_user.viewels
    @my_viewels_p = current_user.viewels.where(private: true)
    @followed_viewels = current_user.followed_viewels.where(private: false)
    @users = User.where("id !=?", current_user.id) 
  end

  def show
  	@viewel = Viewel.find(params[:id])
    @user= @viewel.user
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
