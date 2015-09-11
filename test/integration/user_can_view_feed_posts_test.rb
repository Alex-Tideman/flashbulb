require './test/test_helper'

class UserCanViewFeedPostsTest < ActiveSupport::TestCase
  include Capybara::DSL

  test '#feed' do
    VCR.use_cassette('user_can_view_feed_posts#feed') do
      get_user

      assert_equal "/feed", current_path
      page.must_have_content("Comments")
    end
  end

  test '#dashboard' do
    VCR.use_cassette('user_can_view_feed_posts#feed') do
      get_user

      assert_equal "/dashboard", current_path
      page.must_have_content("Comments")
      page.must_have_content("0 likes")
    end
  end



  def get_user
    user = User.find_or_create_by(provider: "instagram", uid: "2177716938")
    user.save
    user
  end

end