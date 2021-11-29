require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(
      full_name: 'joao vitor montanholi',
      email: 'test@gmail.com.br',
      password: 123_456
    )
  end

  context 'Trying to create a new user' do
    it 'Will not be valid without a full_name' do
      @user.full_name = nil
      expect(@user).to_not be_valid
    end

    it 'Will not be valid with a full_name with not enough characters' do
      @user.full_name = 'joao'
      expect(@user).to_not be_valid
    end

    it 'Will not be valid without a email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'Will not be valid without an apropriate email' do
      @user.email = 'joaoemail.com'
      expect(@user).to_not be_valid
    end

    it 'Will not be valid without a password' do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it 'Will not be valid without an apropriate password' do
      @user.password = 12_345
      expect(@user).to_not be_valid
    end

    it 'Will be valid if all paramaters are correct' do
      expect(@user).to be_valid
    end
  end
end
