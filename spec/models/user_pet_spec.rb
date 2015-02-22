require 'rails_helper'

RSpec.describe UserPet, :type => :model do
  let(:user_pet) { UserPet.new(user_id: 12, pet_id: 465) }

  subject { user_pet }

  it { should respond_to(:user_id) }
  it { should respond_to(:pet_id) }
end
