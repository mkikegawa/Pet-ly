require 'rails_helper'

describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'renders new' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a new User' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'POST #create' do
    context 'valid attributes' do
      it 'create new user' do
        expect {
          post :create, user: FactoryGirl.attributes_for(:user)
        }.to change(User, :count).by(1)
      end

      it 'redirects to users#show' do
        post :create, user: FactoryGirl.attributes_for(:user)
        expect(response).to redirect_to(user_path(User.last.id))
      end
    end

    context 'invalid attributes' do
      let(:invalid_attributes) { { name: '' } }

      it 'does not create a new user' do
        expect {
          post :create, user: invalid_attributes 
        }.to_not change(User, :count)
      end

      it 're-renders new' do
        post :create, user: invalid_attributes
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #show" do
    let(:user) { FactoryGirl.create(:user) }

    before { sign_in user, no_capybara: true }

    it 'renders show' do
      get :show, id: user.id
      expect(response).to render_template(:show)
    end

    it 'assigns correct user' do
      get :show, id: user.id
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'GET #index' do
    User.destroy_all
    let(:admin) { FactoryGirl.create(:admin) }
    let(:user1) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.create(:user) }

    before { sign_in admin, no_capybara: true }
    
    it 'renders index' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'populate an array of users' do
      get :index
      expect(assigns(:users)).to eq([admin, user1, user2])
    end
  end

  describe 'GET #edit' do
    let(:user) { FactoryGirl.create(:user) }

    before { sign_in user, no_capybara: true }

    it 'renders edit' do
      get :edit, id: user.id
      expect(response).to render_template(:edit)
    end

    it 'assigns correct user' do
      get :edit, id: user.id
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'PATCH #update' do
    let(:user) { FactoryGirl.create(:user, name: 'Martin Kikegawa') }
     
    before { sign_in user, no_capybara: true }

    context 'valid attributes' do
      it 'updates user' do
        patch :update, id: user.id, user: { name: 'Inder Tofu' }
        user.reload
        expect(user.name).to eq('Inder Tofu')
      end

      it 'redirects to users#show' do
        patch :update, id: user.id, user: { name: 'Inder Tofu'}
        expect(response).to redirect_to(user_path(user.id))
      end
    end

    context 'invalid attributes' do
      it 'does not update user' do
        patch :update, id: user.id, user: { name: '' }
        user.reload
        expect(user.name).to eq('Martin Kikegawa')
      end

      it 're-renders edit' do
        patch :update, id: user.id, user: { name: '' }
        expect(response).to render_template(:edit)
      end
    end
  end  

  describe 'DELETE #destroy' do
    it 'redirects to index' do
      admin = FactoryGirl.create(:admin)
      sign_in admin, no_capybara: true

      delete :destroy, id: admin.id
      expect(response).to redirect_to(users_path)
    end
  end
end



