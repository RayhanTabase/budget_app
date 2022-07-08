require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  describe 'Categories' do
    scenario 'I see the splash page' do
      visit '/'
      expect(page).to have_content('Aposor')
      expect(page).to have_content('LOG IN')
      expect(page).to have_content('SIGN UP')
    end
  end
end