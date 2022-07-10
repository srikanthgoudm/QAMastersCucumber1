@regression
Feature: Automation practice Login feature
  As a User
  I Want to login to my account
  So that I can access my account details

  Background:
    Given I am on the home page
    When I select signIn link
    Then I should be on Authentication page

  #Happy Path Scenario - Valid Data
  @login
  Scenario: Verify user can login successfully with valid credentials
    When I provide username as testaccount123@mailinator.com and password as Password123
    And I select SignIn button
    Then I should be loggedIn successfully
    And I should be on My account page


   #UnHappy Path Scenario - Invalid Data
  @regression3 @login2
  Scenario: Verify that user can not login with invalid credentials and see the validation message
    When I provide username as sd234324@gmail.com and password as sdfsdfdsf
    And I select SignIn button
    Then I should be on Authentication page
    And I should see validation message as "Invalid email address."

  @regression3 @smoke3
  Scenario: Verify that user can not login with invalid credentials and see the validation message
    When I provide username as " " and password as ""
    And I select SignIn button
    Then I should be on Authentication page
    And I should see validation message as "An email address required."


  @regression3 @smoke3
  Scenario: Verify that user can not login with invalid credentials and see the validation message
    When I provide username as " " and password as sdfsdfdsf
    And I select SignIn button
    Then I should be on Authentication page
    And I should see validation message as "An email address required."

  @regression3 @smoke3
  Scenario: Verify that user can not login with invalid credentials and see the validation message
    When I provide username as testaccount123@gmail.com and password as " "
    And I select SignIn button
    Then I should be on Authentication page
    And I should see validation message as "Password is required."

  @regression3 @smoke3
  Scenario: Verify that user can not login with invalid credentials and see the validation message
    When I provide username as "testaccount123@gmail.com" and password as "sdfsdfdsf"
    And I select SignIn button
    Then I should be on Authentication page
    And I should see validation message as "Authentication failed."