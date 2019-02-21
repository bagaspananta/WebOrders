Capybara.register_driver :mobagent do |app|
  require 'capybara'
  require 'selenium-webdriver'
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile['general.useragent.override'] = "Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_0 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7A341 Safari/528.16"
  options = Selenium::WebDriver::Firefox::Options.new(profile: profile)
  Capybara::Selenium::Driver.new(app, :options => options)
end
Capybara.use_default_driver