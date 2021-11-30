require 'rails_helper'

RSpec.describe 'Food page', type: :feature do
  describe 'root page test' do
    before(:each) do
      @user = create(:user)
      @recipe = create(:recipe, user_id: @user.id)

      visit new_user_session_path
      within('#new_user') do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
      end
      click_button 'Log in'
      visit foods_path
      click_link 'New Food'
      fill_in 'food_name', with: 'Bolo'
      select('Grams', from: 'food_measurement_unit')
      fill_in 'food_price', with: 1
      click_button 'Create Food'
    end

    it 'expects to see page title' do
      expect(page).to have_content('Food was successfully created.')
    end

    it 'should delete one food item' do
      visit foods_path
      click_link 'Destroy'
      expect(page).not_to have_content('Bolo')
    end

    it 'should create one food item' do
      visit foods_path
      click_link 'New Food'
      fill_in 'food_name', with: 'Another Bolo'
      select('Grams', from: 'food_measurement_unit')
      fill_in 'food_price', with: 1
      click_button 'Create Food'
      expect(page).to have_content('Another Bolo')
    end
  end
end