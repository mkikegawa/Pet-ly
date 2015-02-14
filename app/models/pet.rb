class Pet < ActiveRecord::Base

  def self.search(term = nil)
    term ||= 'type=animals&orgId=858&limit=10'
    pet = HTTParty.get "https://api.rescuegroups.org/rest/?#{ api_key }#{ term }"
  end


  def self.api_key
    'key=w7sqjb4R&'
  end

end