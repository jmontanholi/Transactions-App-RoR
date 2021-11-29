require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:each) do
    @user = User.create(
      full_name: 'joao vitor montanholi',
      email: 'test@gmail.com.br',
      password: 123_456
    )

    @expense = Expense.new(
      name: 'Hamburguer',
      amount: 17.50,
      author_id: @user.id
    )
  end

  context 'Trying to create a new category' do
    it 'Will not be valid without a name' do
      @expense.name = nil
      expect(@expense).to_not be_valid
    end

    it 'Will not be valid with a name with not enough characters' do
      @expense.name = 'Ice'
      expect(@expense).to_not be_valid
    end

    it 'Will not be valid without an amount' do
      @expense.amount = nil
      expect(@expense).to_not be_valid
    end

    it 'Will not be valid without an appropriate amount' do
      @expense.amount = -2
      expect(@expense).to_not be_valid
    end

    it 'Will not be valid without a user' do
      @expense.author_id = nil
      expect(@expense).to_not be_valid
    end

    it 'Will not be valid without an apropriate user' do
      @expense.author_id = -2
      expect(@expense).to_not be_valid
    end

    it 'Will be valid if all paramaters are correct' do
      expect(@expense).to be_valid
    end
  end
end
