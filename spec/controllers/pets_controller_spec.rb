require 'rails_helper'

describe PetsController, type: :controller do
  let(:pet1) { FactoryGirl.create(:pet) }
  let(:pet2) { FactoryGirl.create(:pet) }

  describe 'GET#index' do
    it 'renders index' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'renders show' do
      get :show, id: pet1.id
      expect(response).to render_template(:show)
    end

    it 'assigns correct pets' do
      get :show, id: pet1.id
      expect(assigns(:pet)).to eq(pet1)
    end
  end
end
