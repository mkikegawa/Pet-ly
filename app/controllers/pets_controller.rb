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
    id = 
    pet_result = Pet.search("type=animals&limit=100")['pets']['pet']
    id_select = params.select do | k, v |
      k.slice('animalID') == 'animalID'
    end
    result = pet_result.select do |pet| 
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
          videoUrl1:   pet['videoUrl1'],
          video1:      pet['video1'], 
          pic1:        pet['pic1'],
          pictmn1:     pet['pictmn1'],
          pic2:        pet['pic2'],
          pictmn2:     pet['pictmn2'],  
          pic3:        pet['pic3'],
          pictmn3:     pet['pictmn3'],  
          pic4:        pet['pic4'],
          pictmn4:     pet['pictmn4']  
      }
      @pet = User.find(params['user'].to_i).pets.create(pet_parsed)
    end
      redirect_to user_path(params['user'].to_i), notice: 'Pet was successfully created.'
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

end
