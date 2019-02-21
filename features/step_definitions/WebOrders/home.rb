Given(/^I am on the WebOrders homepage$/) do
  visit "#{BASE_URL}/samples/TestComplete11/WebOrders/"
end

And (/^I enter the username "(.*?)" and password "(.*?)"$/) do |username, password|
   fill_in 'ctl00_MainContent_username', :with=> username
   fill_in 'ctl00$MainContent$password', :with=> password
end

And (/^I click the Login button$/) do
	find(:css, "#ctl00_MainContent_login_button").click
end

When (/^I click logout$/) do
	find(:css, "#ctl00_logout").click
    find("#ctl00_MainContent_login_button").value
end

Then (/^I should be on the WebOrders homepage$/) do
   	find("#ctl00_MainContent_login_button").value.should == "Login"
end

Then (/^I should be on the WebOrder dashboard$/) do
 	value = find(".menu").text
 	value.should == "View all orders\nView all products\nOrder"	
end

When (/^I input email with "(.*?)"$/)do |emailUser|
	fill_in 'LoginForm[username]', :with => emailUser
end

And (/^I input password with "(.*?)"$/) do |passwordUser|
	fill_in 'LoginForm[password]', :with => passwordUser
end

Then /^I go into debug mode$/ do
     require 'ruby-debug'
     debugger
     1
end

