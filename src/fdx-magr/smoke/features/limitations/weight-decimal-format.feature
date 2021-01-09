@magr @weight-format
Feature: Prevent incorrect weight shipments
  In order to prevent incorrect rate input
  As a user
  I want to quickly see my input errors in the form

  Background: Open application
    Given I browse to MAGR application

  Scenario: Incorrect weight format
    Given I ship from the "new mandarin plaza" address in "Hong Kong"
    And I ship to the "38225" address in "United States"
    When my package weighs 10.5,1
    Then I see an error message that I should enter a valid weight