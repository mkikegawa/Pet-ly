class User < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3, maximum: 254 }
  validates :profile, presence: true, length: { minimum: 3, maximum: 254 }
end
