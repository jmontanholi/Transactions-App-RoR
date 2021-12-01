require 'rails_helper'

RSpec.describe 'Expense Pages', type: :feature do
  describe 'Transactions Page' do
    before(:all) do
      user = User.create(
        full_name: 'Joao Vitor Montanholi',
        email: 'test3@gmail.com',
        password: 123_456
      )
      @category = user.categories.create(
        name: 'Hamburger',
        icon: 'Hamburger.jpg'
      )
    end

    before(:each) do
      visit new_user_session_path
      fill_in 'Email', with: 'test2@gmail.com'
      fill_in 'Password', with: 123_456
      click_button 'Log in'
    end

    it 'Expects to see new expense button on transactions page' do
      visit "/categories/#{@category.id}"
      expect(page).to have_content('NEW EXPENSE')
    end

    it 'Can go to create new expense page' do
      visit "/categories/#{@category.id}"
      click_link 'NEW EXPENSE'
      expect(page).to have_content('CREATE EXPENSE')
    end
  end
end
