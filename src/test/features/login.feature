@regression
Feature: Automation practice Login feature
  As a User
  I Want to login to my account
  So that I can access my account details

  Background:
    Given I am on the home page
    When I select signIn link
    Then I should be on Authentication page

  #Happy Path Scenario
  @smoke
  Scenario: Verify user can login successfully with valid credentials
    When I provide username as testaccount123@mailinator.com and password as Password123
    And I select SignIn button
    Then I should be loggedIn successfully
    And I should be on My account page

#Unhappy path scenarios
  @regression @smoke
  Scenario Outline: Verify that user can not login with invalid credentials and see validation message
    When I provide username as <username> and password as <password>
    And I select signIn link
    Then I should be on Authentication page
    And I should see validation message as <validation_message>
    Examples:
      | username           | password    | validation_message         |
      | sd234324@gmail.com | sdfsdfdsf   | Invalid email address.     |
      | sd234324@gmail.com | Password123 | Invalid email address.     |
      | test123@gmail.com  | sdfsdfdsf   | Authentication failed.     |
      |                    | sdfsdfdsf   | An email address required. |
      |                    |             | An email address required. |
      | test123@gmail.com  | sdfsdfdsf   | Password is required.      |