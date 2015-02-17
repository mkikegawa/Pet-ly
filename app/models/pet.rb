class Pet < ActiveRecord::Base

  has_many :user_pets
  has_many :user, through: :user_pets

  def self.search(term = nil)
    term ||= 'type=animals&orgId=858&limit=10'
    pet = HTTParty.get "https://api.rescuegroup.org/rest/?#{ api_key }#{ term }"
  end

  private

  def self.api_key
  'key=w7sqjb4R&' 
  end 

end
