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
      let(:valid_attributes) { 
        { name:    'Martin Kikegawa', 
          profile: 'I want a grey kitten.' } 
      }

      it 'create new user' do
        expect {
          post :create, user: valid_attributes
        }.to change(User, :count).by(1)
      end

      it 'redirects to users#show' do
        post :create, user: valid_attributes
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
    let(:user) { User.create(name: 'Martin Kikegawa', 
        profile: 'I want a grey kitten.') }

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
    let(:user1) { User.create(name: 'Martin Kikegawa', 
          profile: 'I want a grey kitten.') }
    let(:user2) { User.create(name: 'Marcy Criner', 
          profile: 'I want a tabby cat.') }
    
    it 'renders index' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'populate an array of users' do
      get :index
      expect(assigns(:users)).to eq([user1, user2])
    end
  end

  describe 'GET #edit' do
    let(:user) { User.create(name: 'Martin Kikegawa', 
          profile: 'I want a grey kitten.') }

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
    let(:user) { User.create(name: 'Martin Kikegawa', 
          profile: 'I want a grey kitten.') }

    context 'valid attributes' do
      it 'updates user' do
        patch :update, id: user.id, user: { profile: 'I want a grey cat.'}
        user.reload
        expect(user.profile).to eq('I want a grey cat.')
      end

      it 'redirects to users#show' do
        patch :update, id: user.id, user: { profile: 'I want a grey cat.'}
        expect(response).to redirect_to(user_path(user.id))
      end
    end

    context 'invalid attributes' do
      it 'does not update user' do
        patch :update, id: user.id, user: { profile: '' }
        user.reload
        expect(user.profile).to eq('I want a grey kitten.')
      end

      it 're-renders edit' do
        patch :update, id: user.id, user: { profile: '' }
        expect(response).to render_template(:edit)
      end
    end
  end  

  describe 'DELETE #destroy' do
    it 'deletes requested user' do
      user = User.create(name: 'Martin Kikegawa', 
          profile: 'I want a grey kitten.')
      expect {
        delete :destroy, id: user.id
      }.to change(User, :count).by(-1)
    end

    it 'redirects to index' do
      user = User.create(name: 'Martin Kikegawa',
            profile: 'I want a grey kitten.')
      delete :destroy, id: user.id
      expect(response).to redirect_to(users_path)
    end
  end
end



