require 'rails_helper'

describe 'static pages' do
  subject { page }

  describe 'home page' do
    before { visit root_path }
    
    it { should have_title('Home')}
    it { should have_selector('h1', text: 'Welcome') }
  end

  describe 'about page' do
    before { visit about_path }

    it { should have_title('All About Pet.ly') }
    it { should have_selector('h1', text: 'About Pet.ly') }
  end
end 