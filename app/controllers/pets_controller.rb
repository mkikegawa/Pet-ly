class PetsController < ApplicationController
  before_action :set_pet, only:          [:show, :edit, :update, :destroy]
  before_action :signed_in_user, except: [:index, :show]
  before_action :correct_user,   except: [:new, :create, :index, :show]
  
  def index
    @active = 'pets'
    @pets = Pet.all
  end

  def show
    @active = 'pets'
  end

  def new
    @active ='pets'
    @pet = Pet.new
    @pet_search = Pet.search("type=animals&limit=10")
  end

  def create
    @active = 'pets'
    pet_result = Pet.search("type=animals&limit=30")['pets']['pet']
    id_select = params.select do | k, v |
      k.slice('animalID') == 'animalID'
    end
    id_select.each do |k , v| 
      pet = pet_result.select do | result |
       result['animalID'] == v
      end
      if Pet.exists?(animalID: pet.first['animalID'])
        UserPet.find_or_create_by(user_id: @current_user.id, pet_id: Pet.map_animalID_to_pet_id(pet))  
      else 
      pet_parsed = {
          name:        pet.first['name'], 
          summary:     pet.first['summary'], 
          species:     pet.first['species'], 
          breed:       pet.first['breed'], 
          sex:         pet.first['sex'], 
          age:         pet.first['age'], 
          color:       pet.first['color'], 
          description: pet.first['description'], 
          animalID:    pet.first['animalID'],
          orgID:       pet.first['orgID'], 
          videoUrl1:   pet.first['videoUrl1'],
          video1:      pet.first['video1'], 
          pic1:        pet.first['pic1'],
          pictmn1:     pet.first['pictmn1'],
          pic2:        pet.first['pic2'],
          pictmn2:     pet.first['pictmn2'],  
          pic3:        pet.first['pic3'],
          pictmn3:     pet.first['pictmn3'],  
          pic4:        pet.first['pic4'],
          pictmn4:     pet.first['pictmn4']  
      }
        @pet = User.find(@current_user.id).pets.create(pet_parsed)
      end
    end
    redirect_to user_path(@current_user.id), notice: 'Pet Matches are successfully recorded.'
  end
 
  def edit
    @active = 'pets'
  end

  def update
    if @pet.update_attributes(pet_params)
      flash[:success] = 'Pet updated.'
      redirect_to pets_path(@pet.id)
    else
      render 'edit'
    end
  end

  def destroy
    @pet.destroy
    flash[:success] = 'Pet deleted.'
    redirect_to pets_path
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def correct_user
    unless current_user?(@pet.users) || current_user.admin?
      redirect_to user_path(current_user)
    end
  end


end





