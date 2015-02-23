require 'rails_helper'

RSpec.describe Pet, :type => :model do
  let(:pet) { FactoryGirl.create(:pet) }

  subject { pet }

  it { should respond_to(:name) }
  it { should respond_to(:summary) }
  it { should respond_to(:species) }
  it { should respond_to(:breed) }
  it { should respond_to(:sex) }
  it { should respond_to(:age) }
  it { should respond_to(:color) }
  it { should respond_to(:description) }
  it { should respond_to(:animalID) }
  it { should respond_to(:orgID) }
  it { should respond_to(:video1) }
  it { should respond_to(:videoUrl1) }
  it { should respond_to(:pic1) }
  it { should respond_to(:pictmn1) }
  it { should respond_to(:pic2) }
  it { should respond_to(:pictmn2) }
  it { should respond_to(:pic3) }
  it { should respond_to(:pictmn3) }
  it { should respond_to(:pic4) }
  it { should respond_to(:pictmn4) }

  it  { should be_valid }
end
