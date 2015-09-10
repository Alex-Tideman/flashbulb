require './test/test_helper'

class UserCanViewFeedPostsTest < ActiveSupport::TestCase
  include Capybara::DSL

  test '#feed' do
    VCR.use_cassette('user_can_view_feed_posts#feed') do

      assert_equal "/dashboard", current_path
      page.must_have_content("Comments")
    end
  end

end