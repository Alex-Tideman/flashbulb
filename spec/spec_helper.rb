require 'webmock'
require 'vcr'
require 'simplecov'


  VCR.configure do |config|
    config.cassette_library_dir = "spec/cassettes"
    config.hook_into :webmock
  end

  SimpleCov.start do
    add_filter 'config'
    add_filter 'application_controller'
  end


  RSpec.configure do |config|
    require 'database_cleaner'
    require 'capybara/rspec'

  SimpleCov.start 'rails'

  config.include Capybara::DSL

  config.after(:each) do
    DatabaseCleaner.clean
  end

  WebMock.stub_request(:any, "www.localhost:3000")


  def user
    @user ||= User.new(name: "Alex Tideman",
                       nickname: "al.tides",
                       bio: "Coding at Turing.",
                       image: "default.png",
                       token: ENV['instagram_id'],
                       uid: "9999",
                       provider: "instagram")
  end

  def get_user
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new ({
                                                                       'provider'    => user.provider,
                                                                       'uid'         => user.uid,
                                                                       'info'        => {:name =>user.name,
                                                                                         :nickname =>user.nickname,
                                                                                         :bio =>user.bio,
                                                                                         :image =>user.image},
                                                                       'credentials' => {:token => ENV['instagram_id']}
                                                                   })
  end
end


