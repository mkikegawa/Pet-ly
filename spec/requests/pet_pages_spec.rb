require 'rails_helper'

describe 'pet pages' do 
  subject { page }

  describe 'index' do
    let(:user) { FactoryGirl.create(:user) }
    Pet.destroy_all
    let(:pet1) { FactoryGirl.create(:pet) }
    let(:pet2) { FactoryGirl.create(:pet) }

    before { visit pets_path }

    it { should have_title('Pet Adoption Index') }
    it { should have_selector('h1', text: 'Adoption Index')}

    it 'lists each item' do
      Pet.all.each do | pet |
        expect(page).to have_selector('a', text: pet.name)
      end
    end
  end


  
end