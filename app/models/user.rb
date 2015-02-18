class User < ActiveRecord::Base

  has_many :user_pets, dependent: :destroy
  has_many :pets, through: :user_pets

  validates :name, presence: true, length: { minimum: 3, maximum: 254 }
  validates :profile, presence: true, length: { minimum: 3, maximum: 254 }

  


end
