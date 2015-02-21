class Pet < ActiveRecord::Base
  
  validates_uniqueness_of :animalID
  has_many :user_pets, dependent: :destroy
  has_many :users, through: :user_pets
  

  def self.search(term = nil)
    term ||= 'type=animals&limit=20&page=2'
    HTTParty.get "https://api.rescuegroups.org/rest/?#{ api_key }#{ term }"  
  end

  def self.map_animalID_to_pet_id(pet)
    Pet.find_by_animalID(pet.first['animalID']).id
  end

  private

  def self.api_key
  'key=w7sqjb4R&' 
  end 

  def self.num_of_matches(pet)
    result = find_by(animalID: pet['animalID'])
    result ? result.users.length : 0
  end

  
end


