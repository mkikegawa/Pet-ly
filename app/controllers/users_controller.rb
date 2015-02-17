class UsersController < ApplicationController

  def index 
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render 'new'
    end 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'User updated.'
      redirect_to users_path(@user.id)
    else
      render 'edit'
    end
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'User deleted.'
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile)
  end

end
