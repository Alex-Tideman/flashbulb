require "test_helper"
class UserLogsInWithInstagramTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  def setup
    Capybara.app = Flashbulb::Application
  end

  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code
    click_link_or_button "Login"
    assert_equal "/dashboard", current_path
    assert page.has_content?("Comments")
    assert page.has_link?("Logout")
  end

end