require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create(
      full_name: 'joao vitor montanholi',
      email: 'test@gmail.com.br',
      password: 123_456
    )

    @category = Category.new(
      name: 'Food',
      icon: 'No Icon',
      author_id: @user.id
    )
  end

  context 'Trying to create a new category' do
    it 'Will not be valid without a name' do
      @category.name = nil
      expect(@category).to_not be_valid
    end

    it 'Will not be valid with a name with not enough characters' do
      @category.name = 'foo'
      expect(@category).to_not be_valid
    end

    it 'Will not be valid without an icon' do
      @category.icon = nil
      expect(@category).to_not be_valid
    end

    it 'Will not be valid without an appropriate icon length' do
      @category.icon = 'Ic'
      expect(@category).to_not be_valid
    end

    it 'Will not be valid without a user' do
      @category.author_id = nil
      expect(@category).to_not be_valid
    end

    it 'Will not be valid without an apropriate user' do
      @category.author_id = -2
      expect(@category).to_not be_valid
    end

    it 'Will be valid if all paramaters are correct' do
      expect(@category).to be_valid
    end
  end
end
