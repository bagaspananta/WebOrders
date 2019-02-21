Feature: Test Challenge

Scenario: Login and logout into WebOrders
  Given I am on the WebOrders homepage
  And I enter the username "Tester" and password "test"
  And I click the Login button
  Then I should be on the WebOrder dashboard
  
  When I click logout 
  Then I should be on the WebOrders homepage

Scenario: Place a new Order
  Given I am on the WebOrders homepage
  And I enter the username "Tester" and password "test"
  And I click the Login button
  And I click the order link
  And I fill in all the product's information
  And I fill in all the customer's information
  And I fill in all the payment detail
  
  When I click the process button
  Then the order should be processed succesfully

@test
 Scenario: Update and Delete a new Order
  Given I am on the WebOrders homepage
  And I enter the username "Tester" and password "test"
  And I click the Login button

  When I click the first order to edit
  And I change the customer name to "Paul Brown Test2"
  And I click update
  Then I should be on the WebOrder dashboard
  And the customer name should be changed to "Paul Brown Test2"

  #Delete scenario
  When I select the first order to delete
  And I click the delete button
  Then there should not be a customer called "Paul Brown Test2"



