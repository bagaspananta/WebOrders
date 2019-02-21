require 'uri'
require 'net/http'

#CAPYBARA
require 'capybara/cucumber'
require 'capybara/session'
#require './features/support/patches/capybara'

# JSON
require 'openssl'
require 'uri'
require 'net/http'

# BASE64 ENCODE DECODE 
require "base64"

  
# EMAIL 
#require "email_spec" # add this line if you use spork
#require "action_mailer"
#require 'email_spec/cucumber'

# COLORIZE
#require 'colorize'
#require 'colorized_string'

Capybara.default_driver = :selenium
Capybara.run_server = false
Capybara.default_selector = :css
Capybara.default_max_wait_time = 30

require 'configuration.rb'
require File.dirname(__FILE__) + '/../../lib/configuration'

BASE_URL = Configuration["base_url"]
MOBILE_URL = Configuration["mobile_url"]
IMG_URL = Configuration["img_url"]
JSON_URL = Configuration["api_url"]

#require 'rspec/retry'
#RSpec.configure do |config|
#  config.verbose_retry = true #show retry status in spec process
#  config.display_try_failure_messages = true #show exception that triggers a retry if verbose_retry is set to true
#  config.around :each, :js do |ex| #run retry only on features
#    ex.run_with_retry retry: 3
#    config.default_retry_count = 2 #Try twice (retry once)
#    config.exceptions_to_retry = [Net::ReadTimeout] #Only retry when Selenium raises Net::ReadTimeout
#  end
#  config.retry_callback = proc do |ex| #callback to be run between retries 
#    if ex.metadata[:js] #run some additional clean up task - can be filtered by example metadata
#      Capybara.reset!     
#    end
#  end
#end

Capybara.register_driver :selenium do |app|
  require 'capybara'
  require 'selenium-webdriver'
  profile = Selenium::WebDriver::Chrome::Profile.new
  options = Selenium::WebDriver::Chrome::Options.new(profile: profile)
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.open_timeout = 120 #instead of the default 60
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options, http_client: client)
end 

# Before do
#   Capybara.default_driver = :selenium
#   Capybara.default_selector = :css
#   Capybara.default_max_wait_time = 5  
#   Capybara.register_driver(:selenium) { |app|
#     if (!ENV['BROWSER']) or (ENV['BROWSER'] == 'ff13')
#       Capybara::Selenium::Driver.new(app, :browser => :firefox)
#     elsif (ENV['BROWSER'] == 'chrome')
#       Capybara::Selenium::Driver.new(app, :browser => :chrome)
#     else
#       Capybara::Selenium::Driver.new(app,
#                                      :browser => :remote,
#                                      :url => "#{BrowserConfiguration.new.set_browser_url}",
#                                      :desired_capabilities => :"#{BrowserConfiguration.new.set_browser_capabilities}")
#     end
#   }
#   page.driver.browser.manage.window.maximize
# end

After do |scenario| 
 if scenario.failed? 
    encoded_img = page.driver.browser.screenshot_as(:base64)
    self.embed("data:image/png;base64,#{encoded_img}",'image/png')
 end
end

