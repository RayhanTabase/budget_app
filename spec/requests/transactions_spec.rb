require 'rails_helper'

RSpec.describe 'Expenditure', type: :feature do
  describe 'Expenditure' do
    before(:each) do
      @user = User.create! password: '123456', email: 'user@email.com', name: 'User Name'
      @group = Group.create! name: 'group', user_id: @user.id, icon: 'Education'
      @entity = Entity.create! name: 'T1', user_id: @user.id, amount: 20
      @entity2 = Entity.create! name: 'T2', user_id: @user.id, amount: 25
      EntityGroup.create! group_id: @group.id, entity_id: @entity.id
      EntityGroup.create! group_id: @group.id, entity_id: @entity2.id

      visit '/users/sign_in'
      fill_in 'Email', with: 'user@email.com'
      fill_in 'Password', with: '123456'
      click_button 'Log In'
    end

    scenario 'I can see an expenditure I added' do
      click_link 'group'
      expect(page).to have_content('T1')
      expect(page).to have_content('20')
    end

    scenario 'I can see a total expenditure amount' do
      click_link 'group'
      expect(page).to have_content('45')
    end

    scenario 'I can open a a page to add a new expenditure' do
      click_link 'group'
      click_link 'ADD TRANSACTION'
      expect(page).to have_content('New Transaction')
      expect(page).to have_field('Name')
      expect(page).to have_field('Amount')
    end
  end
end
