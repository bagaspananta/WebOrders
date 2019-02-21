Given(/^I click the order link$/) do
  find(:xpath, "//*[@id='ctl00_menu']/li[3]/a").click
end

And (/^I fill in all the product\'s information$/) do 
   fill_in 'ctl00_MainContent_fmwOrder_txtQuantity', :with=> "5"
end

And (/^I fill in all the customer\'s information$/) do
   fill_in 'ctl00_MainContent_fmwOrder_txtName', :with => "Bananta"
   fill_in 'ctl00_MainContent_fmwOrder_TextBox2', :with => "Watson road"
   fill_in 'ctl00_MainContent_fmwOrder_TextBox3', :with => "Melbourne"
   fill_in 'ctl00_MainContent_fmwOrder_TextBox5', :with => "3150"
end

And (/^I fill in all the payment detail$/) do
  find(:css, "#ctl00_MainContent_fmwOrder_cardList_0").click
  fill_in 'ctl00_MainContent_fmwOrder_TextBox6', :with => "12345678901238"
  fill_in 'ctl00_MainContent_fmwOrder_TextBox1', :with => "02/2019"
end

And (/^I click the process button$/) do
   find(:css, "#ctl00_MainContent_fmwOrder_InsertButton").click
end

Then (/^the order should be processed succesfully$/) do
  find(:css, ".buttons_process").text.should == "Process\n\n\nNew order has been successfully added."
end

When (/^I click the first order to edit$/) do
  find(:xpath, "//*[@id='ctl00_MainContent_orderGrid']/tbody/tr[2]/td[13]/input").click
end

And (/^I change the customer name to "(.*?)"$/) do |customer_name|
  fill_in 'ctl00_MainContent_fmwOrder_txtName', :with => customer_name
end

And (/^I click update$/) do
  find(:css, "#ctl00_MainContent_fmwOrder_UpdateButton").click
end

And (/^the customer name should be changed to "(.*?)"$/) do |customer_name|
  find(:xpath, "//*[@id='ctl00_MainContent_orderGrid']/tbody/tr[2]/td[2]").text.should == customer_name
end

When(/^I select the first order to delete$/) do
  find(:css, "#ctl00_MainContent_orderGrid_ctl02_OrderSelector").click
end

When(/^I click the delete button$/) do
  find(:css, "#ctl00_MainContent_btnDelete").click
end

Then(/^there should not be a customer called "(.*?)"$/) do |customer_name|
  find(:xpath, "//*[@id='ctl00_MainContent_orderGrid']/tbody/tr[2]/td[2]").text.should_not == customer_name
end









