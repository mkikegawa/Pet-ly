 require 'rails_helper'

describe User do
  let(:user) { User.new(name: 'Martin Kikegawa', profile: 'I want a grey kitten') }

  subject { user }

  it { should respond_to(:name) }
  it { should respond_to(:profile) }

  it { should be_valid }

  describe 'validations' do
    describe 'name' do
      context 'not present' do
        before { user.name = nil }
        it { should_not be_valid }
      end

      context 'too short' do
        before { user.name = 'a' * 2 }
        it { should_not be_valid }
      end

      context 'too long' do
        before { user.name = 'a' * 255 }
      end
    end

    describe 'profile' do
      context 'not be present'
      before { user.profile = nil }
      it { should_not be_valid }
    end
  end
end