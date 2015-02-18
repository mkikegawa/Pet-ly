class UsersController < ApplicationController
  helper PetsHelper 

  def index 
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @pet = Pet.new
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

  def destroy
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

  def pet_params(pet_result)
    pet_result.require(:pet).permit(
        name:        pet_result['name'], 
        summary:     pet_result['summary'], 
        species:     pet_result['species'], 
        breed:       pet_result['breed'], 
        sex:         pet_result['sex'], 
        age:         pet_result['age'], 
        color:       pet_result['color'], 
        description: pet_result['description'], 
        animalID:    pet_result['animalID'],
        orgID:       pet_result['orgID'], 
        videoUrl1:   pet_result['videoUrl1']
    )

  end
