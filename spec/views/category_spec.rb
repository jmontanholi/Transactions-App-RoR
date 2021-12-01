require 'rails_helper'

RSpec.describe 'Category Pages', type: :feature do
  describe 'index Page' do
    before(:all) do
      user = User.create(
        full_name: 'Joao Vitor Montanholi',
        email: 'test2@gmail.com',
        password: 123_456
      )
      user.categories.create(
        name: 'Food',
        icon: 'food.jpg'
      )
    end

    before(:each) do
      visit new_user_session_path
      fill_in 'Email', with: 'test2@gmail.com'
      fill_in 'Password', with: 123_456
      click_button 'Log in'
    end

    it 'Expects to see category index page' do
      visit user_root_path
      expect(page).to have_content('CATEGORIES')
    end

    it 'Expects to see one category in the index page' do
      visit user_root_path
      expect(page).to have_content('Food')
    end

    it 'Should be able to create new category' do
      visit categories_new_path
      fill_in 'Category Name', with: 'Technology'
      fill_in 'Category Icon', with: 'tech.jpg'
      click_button 'Create'
      expect(page).to have_content('Technology')
    end

    it 'Should be able to go to a categories details page' do
      visit user_root_path
      click_link 'Food'
      expect(page).to have_content('TRANSACTIONS')
    end
  end
end
