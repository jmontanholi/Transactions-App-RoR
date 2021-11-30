require 'rails_helper'

RSpec.describe 'Devise Pages', type: :feature do
  describe 'Sign Up Page' do
    it 'Expects to see page title' do
      visit new_user_registration_path
      expect(page).to have_content('REGISTER')
    end

    it 'Should be able to Sign Up' do
      visit new_user_registration_path
      fill_in 'Full Name', with: 'Joao Vitor Montanholi'
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: 123_456
      fill_in 'Password Confirmation', with: 123_456
      click_button 'Continue'
      expect(page).to have_content('You have signed up successfully.')
    end
  end

  describe 'Login Page' do
    before(:each) do
      User.create(
        full_name: 'Joao Vitor Montanholi',
        email: 'test@gmail.com',
        password: 123_456
      )
    end

    it 'Expects to see page title' do
      visit new_user_session_path
      expect(page).to have_content('LOGIN')
    end

    it 'Should be able to log in' do
      visit new_user_session_path
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: 123_456
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully')
    end
  end
end
