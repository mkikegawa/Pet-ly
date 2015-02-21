module PetsHelper

  def map_animalID_to_pet_id(pet)
    Pet.find_by_animalID(pet.first['animalID']).id
  end

  def match_with_user(pet)
    pet.user_pets.find_by_user_id(current_user.id)
  end

end
