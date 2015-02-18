class PetsController < ApplicationController
  
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    # @pet = Pet.new
    pet_result = Pet.search("type=animals&limit=100")['pets']['pet']
  end

  def create
    pet_result = Pet.search("type=animals&limit=100")['pets']['pet']
    id_select = params.select do | k, v |
      k.slice('animalID') == 'animalID'
    end
    result = pet_result.map do |pet| 
      id_select.each_value do | value |
        pet['animalID'] == value
      end
    end
    result.each do |pet|
      pet_parsed = {
          name:        pet['name'], 
          summary:     pet['summary'], 
          species:     pet['species'], 
          breed:       pet['breed'], 
          sex:         pet['sex'], 
          age:         pet['age'], 
          color:       pet['color'], 
          description: pet['description'], 
          animalID:    pet['animalID'],
          orgID:       pet['orgID'], 
          videoUrl1:   pet['videoUrl1']
      }
      @pet = Pet.new(pet_parsed)
    end
      redirect_to user_path(params['user'][:value].id), notice: 'Pet was successfully created.'
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

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    flash[:success] = 'Pet deleted.'
    redirect_to pets_path
  end

  # private

  # def pet_params(pet_result)
  #   pet_result.require(:pet).permit(:name, :summary, :species, :breed, 
  #     :sex, :age, :color, :description, :animalID, :orgID, :videoUrl1)
  # end

end
