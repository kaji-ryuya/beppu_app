require 'capybara/rspec'
RSpec.configure do |config|
  config.before(:each, type: :system) do
    ENV['GOOGLE_API_KEY'] = 'AIzaSyA3ojAIwryanv-OpaN1A40BZ6dG_Dgu7PI'
    driven_by :selenium, using: :headless_chrome
  end
end