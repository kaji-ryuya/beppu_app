require 'capybara/rspec'
RSpec.configure do |config|
  config.before(:each, type: :system) do
    ENV['GOOGLE_API_KEY'] = ENV['GOOGLE_TEST_API_KEY']
    driven_by :selenium, using: :headless_chrome
  end
end