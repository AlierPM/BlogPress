# spec/support/capybara.rb

require 'capybara/rspec'
require 'selenium-webdriver'

Capybara.configure do |config|
  Capybara.default_driver = :selenium_chrome # Set the driver you want to use
  config.javascript_driver = :selenium_chrome
  config.default_max_wait_time = 10 # Set the value to a higher number (in seconds) if needed
end
