class UsersController < ApplicationController
  
  def show
   @user = User.find(params[:id])
  end

  def edit
   @user = User.find(params[:id])
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
    #[TBD] if login
    @user = User.find(params[:id])
    if @user.update(user_params_edit)
      flash[:success] = "Updated user information"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def user_params_edit
    params.require(:user).permit(:name, :email, :profile, :location)
  end
  
end
