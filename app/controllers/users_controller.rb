class UsersController < ApplicationController
  

  def index 
    @users = User.all
  end
 
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new

  def create
    @user = User.new(params)
    if @user.save
      render_to @user, notice: 'User was successful created.'
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
      flash[:success] = 'Item updated.'
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'Item deleted.'
    redirected_to user_path
  end

  def user_params
    params.require(:user).permit(:name, :profile)
  end
  
end
