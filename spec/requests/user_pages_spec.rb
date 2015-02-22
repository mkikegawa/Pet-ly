require 'rails_helper'

describe 'user pages' do 
  subject { page }
  
  describe 'new user page' do
    before { visit signup_path }

    it { should have_title('Sign Up') }
    it { should have_selector('h1', 'Sign Up') }

    describe 'create user' do
      let(:submit) { 'Save' }

      context 'valid information' do
        before do
          fill_in 'Name',             with: 'Martin Kikegawa'
          fill_in 'Profile',          with: 'I like fluffy kittens.'
          fill_in 'Email',            with: 'mkikegawa@gmail.com'
          fill_in 'Password',         with: 'foobar'
          fill_in 'Confirm password', with: 'foobar'
        end

        it 'creates user' do
          expect { click_button submit }.to change(User, :count).by(1)
        end

        describe 'after saving' do
          before { click_button submit }

          it { should have_title('Martin Kikegawa') }
        end
      end

      context 'invalid information' do
        it 'does not create user' do
          expect { click_button submit }.not_to change(User, :count)
        end

        describe 'after submission' do
          before { click_button submit }

          it { should have_title('Sign Up') }
          it { should have_content('error') }
        end
      end
    end
  end
end