class Pet < ActiveRecord::Base

  has_many :userpet
  has_many :user, through: :userpet

  def self.search(term = nil)
    term ||= 'type=animals&limit=10'
    pet = HTTParty.get "https://api.rescuegroups.org/rest/?#{ api_key }#{ term }"
    
  end

  private

  def self.api_key
  'key=w7sqjb4R&' 
  end 

end


