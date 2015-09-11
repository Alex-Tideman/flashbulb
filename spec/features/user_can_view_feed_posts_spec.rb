require './spec/rails_helper'

RSpec.describe "User can access feed after logging in", type: :feature do

  it 'user can view feed' do
    VCR.use_cassette('user_can_view_feed_posts_test#feed') do
      visit root_path
      get_user

      click_link_or_button 'Login'

      expect(current_path).to eq dashboard_path

      expect(page).to have_content("al.tides")
      expect(page).to have_content("followers")
      expect(page).to have_content("Comments")

      expect(page).to have_content("Logout")

      click_link_or_button 'My Media'

      expect(current_path).to eq dashboard_path

      expect(page).to have_content("al.tides")
      expect(page).to have_content("followers")
      expect(page).to have_content("Comments")

      expect(page).to have_content("Logout")

    end
  end

  it 'user can view dashboard' do
    VCR.use_cassette('user_can_view_feed_posts_test#dashboard') do
      visit root_path
      get_user

      click_link_or_button 'Login'

      expect(current_path).to eq dashboard_path

      click_link_or_button 'Feed'

      expect(current_path).to eq feed_path

      expect(page).to have_content("al.tides")
      expect(page).to have_content("@jeffthebrotherhood @infinitycat - clotn")
      expect(page).to have_content("Logout")

    end
  end


    it 'user can view search page' do
      VCR.use_cassette('user_can_view_search_posts_test#search') do
        visit root_path
        get_user

        click_link_or_button 'Login'

        expect(current_path).to eq dashboard_path

        within("#topmenu") do
          fill_in "search", :with => "Alex"
          click_button ''
        end

        expect(current_path).to eq search_path

      end
    end

  it 'user gets message if no search results' do
    VCR.use_cassette('user_gets_no_results_message_test#search') do
      visit root_path
      get_user

      click_link_or_button 'Login'

      expect(current_path).to eq dashboard_path

      within("#topmenu") do
        fill_in "search", :with => "asdfa;lqwe;asdlkfaf"
        click_button ''
      end

      expect(current_path).to eq search_path
      expect(page).to have_content("No search results match!")


    end
  end



end