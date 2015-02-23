module PetsHelper

  def map_animalID_to_pet_id(pet)
    Pet.find_by_animalID(pet.first['animalID']).id
  end

  def match_with_user(pet)
    pet.user_pets.find_by_user_id(current_user.id)
  end

  def pet_create_parse(pet)
    {
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
  end

  def pets_chosen(params)
    id_select = params.select do | k, v |
      k.slice('animalID') == 'animalID'
    end
  end
  
end
