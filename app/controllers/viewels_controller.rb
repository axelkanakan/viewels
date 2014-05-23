class ViewelsController < ApplicationController
  
  def index
    @my_viewels = current_user.viewels.where(private: false )
    @my_viewels_p = current_user.viewels.where(private: true)
    @followed_viewels = current_user.followed_viewels.where(private: false)
    @users = User.where("id !=?", current_user.id)

  end

  def personal
    @my_viewels = current_user.viewels.where(private: false)
    @my_viewels_p = current_user.viewels.where(private: true)
    @followed_viewels = current_user.followed_viewels.where(private: false)
    @users = User.where("id !=?", current_user.id) 
  end

  def show
  	@viewel = Viewel.find(params[:id])
    @user= @viewel.user
  end


  def edit
    @viewel = Viewel.find(params[:id])
    authorize! :edit, @viewel, message: "You need to own the viewel to edit it."
  end

  def update
    @viewel = Viewel.find(params[:id])
    authorize! :update, @viewel, message: "You need to own the post to edit it."
    if @viewel.update_attributes(params[:viewel])
      render :show, notice: "Post was saved successfully."
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
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

  def destroy
    @viewel = Viewel.find(params[:id])
    name = @viewel.title 
    if @viewel.destroy
      authorize! :destroy, @viewel, message: "You need to own the Viewl to delete it."
      if @viewel.title?
      flash[:notice] ="#{name} was deleted successfully!"
      redirect_to root_path
      else
        flash[:notice]="Viewl deleted successfully!"
        redirect_to root_path
      end
    else
      flash[:error]= "There was an error deleting Viewl!"
      render :show 
  end
end
end
