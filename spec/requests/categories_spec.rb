require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  describe 'Categories' do
    before(:each) do
      @user = User.create! password: '123456', email: 'user@email.com', name: 'User Name'
      Group.create! name: 'group', user_id: @user.id, icon: 'icon'
      visit '/users/sign_in'
      fill_in 'Email', with: 'user@email.com'
      fill_in 'Password', with: '123456'
      click_button 'Log In'
    end

    scenario 'I see add a category button' do
      expect(page).to have_content('ADD CATEGORY')
    end

    scenario 'I can see a category I added' do
      expect(page).to have_content('group')
    end

    scenario 'A NEW CATEGORY page' do
      click_link 'ADD CATEGORY'
      expect(page).to have_content('New Category')
      expect(page).to have_field('Icon url')
      expect(page).to have_field('Name')
    end
  end
end
