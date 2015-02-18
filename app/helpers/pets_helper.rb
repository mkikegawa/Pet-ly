module PetsHelper

  # def api_to_db(parse)
  #   pet_result = Pet.search("type=animals&limit=1&animalID=#{ parse['animalID'].to_i }")['pets']['pet']
  #   pet_parsed = {
  #       name:        pet_result['name'], 
  #       summary:     pet_result['summary'], 
  #       species:     pet_result['species'], 
  #       breed:       pet_result['breed'], 
  #       sex:         pet_result['sex'], 
  #       age:         pet_result['age'], 
  #       color:       pet_result['color'], 
  #       description: pet_result['description'], 
  #       animalID:    pet_result['animalID'],
  #       orgID:       pet_result['orgID'], 
  #       videoUrl1:   pet_result['videoUrl1']
  #   }
  #   @pet = Pet.create(pet_parsed)
  # end

end
