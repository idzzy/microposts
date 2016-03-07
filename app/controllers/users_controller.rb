class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  before_action :check_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end

  def edit
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.id == session[:user_id]
      if @user.update(user_params_update)
        flash[:success] = "Updated user information"
        redirect_to user_path(@user)
      else
        render 'edit'
      end
    else
      redirect_to root_path  
    end
    
  end

  def followings
    @user = User.find(params[:id])
    @followings = @user.following_users
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.follower_users
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def user_params_update
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :profile, :location)
  end
  
  def set_user
    @user = User.find(params[:id])
  end

  def check_user
    #unless current_user == User.find(params[:id])
    unless current_user == @user
      redirect_to root_path
    end
  end

end
