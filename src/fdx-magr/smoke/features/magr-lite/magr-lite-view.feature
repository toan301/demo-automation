@magr-lite @login
Feature: magr lite view
  In order to check rates quickly
  I want to see rates

  Background: Open application
    Given I browse to MAGR lite application

  Scenario: check application loads in lite mode with less fields for logged-in user
    Given As a "MAGICJAPAN" user I login to MAGR full
    And I check appbar is not shown
    And I check LTL link is shown
    And I notice that sender and receiver fields are not present
    And I check FROM field is populated with default user address in "JP"
    And I ship from the "Haagweg" address in "Netherlands"
    And I ship to the "38225" address in "United States"
    And my package weighs 12
    And carriage value field in not available for magr-lite
    And I request rates
    And I do not see signature options
    Then I cannot choose to have the shipment picked up
    Then rate list is shown

  Scenario: check application loads for anonymous user
    And I check appbar is not shown
    And I check LTL link is shown
    And I notice that sender and receiver fields are not present
    And I ship from the "Haagweg" address in "Netherlands"
    And I ship to the "38225" address in "United States"
    And my package weighs 12
    And carriage value field in not available for magr-lite
    And I request rates
    And I do not see signature options
    Then I cannot choose to have the shipment picked up
    Then rate list is shown
