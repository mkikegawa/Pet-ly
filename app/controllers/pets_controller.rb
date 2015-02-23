class PetsController < ApplicationController
  before_action :set_pet,        only:   [:show, :edit, :update, :destroy]
  before_action :signed_in_user, except: [:index, :show]
  before_action :correct_user,   only:   [:edit, :destroy]
  
  def index
    @active = 'pets'
    @pet = Pet.all
  end

  def show
    @active = 'pets'
  end

  def new
    @active ='pets'
    @pet = Pet.new
    @pet_search = Pet.search("type=animals&limit=30")
  end

  def create
    @active = 'pets'
    search_result = Pet.search("type=animals&limit=30")['pets']['pet']
    pets_chosen(params).each do |k , v| 
      pet = search_result.select do | result |
       result['animalID'] == v
      end
      if Pet.exists?(animalID: pet.first['animalID'])
        UserPet.find_or_create_by(user_id: @current_user.id, 
            pet_id: map_animalID_to_pet_id(pet))  
      else 
        User.find(@current_user.id).pets.create(pet_create_parse(pet))
      end
    end
    redirect_to user_path(@current_user.id), 
        notice: 'Pet Matches are successfully recorded.'
  end
 
  def edit
    @active = 'pets'
  end

  def destroy
    if current_user.admin?
      @pet.destroy
      flash[:success] = 'Pet deleted.'
    else
      @pet.user_pets.find_by_user_id(current_user.id).destroy

      flash[:success] = 'Favorite deleted'     
    end 
    redirect_to pets_path
  end 

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def correct_user
    unless current_user || current_user.admin?
      redirect_to user_path(current_user)
    end
  end

end





