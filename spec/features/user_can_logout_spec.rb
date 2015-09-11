require './spec/rails_helper'

RSpec.describe "User can logout after logging in", type: :feature do

  it 'user can view feed' do
    VCR.use_cassette('user_can_logout_test#logout') do
      visit root_path
      get_user

      click_link_or_button 'Login'

      expect(current_path).to eq dashboard_path

      expect(page).to have_content("al.tides")
      expect(page).to have_content("followers")
      expect(page).to have_content("Comments")

      expect(page).to have_content("Logout")
      click_link_or_button 'Logout'

      expect(current_path).to eq root_path

      expect(page).to have_no_content("My Media")
      expect(page).to have_no_content("Feed")

    end
  end

end