class User < ActiveRecord::Base

  has_many :userpet
  has_many :pets, through: :userpet

  validates :name, presence: true, length: { minimum: 3, maximum: 254 }
  validates :profile, presence: true, length: { minimum: 3, maximum: 254 }

  


end
