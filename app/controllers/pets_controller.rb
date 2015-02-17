class PetsController < ApplicationController
  
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to user_path, notice: 'Pet was successfully created.'
    else
      render 'new'
    end
  end
 
  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update_attributes(pet_params)
      flash[:success] = 'Pet updated.'
      redirect_to pets_path(@pet.id)
    else
      render 'edit'
    end
  end

  def delete
    @pet = Pet.find(params[:id])
    @pet.destroy
    flash[:success] = 'Pet deleted.'
    redirect_to pets_path
  end

  private

  def pet_params
    params.require(:pet).permit(:name. :summary, :species, :breed, 
      :sex, :age, :color, :description)
  end

end
