@magr @signup-notifications
Feature: Inform anonymous users with
  In order to get quotes
  As a user
  I want to get quote

  Background: Open application
    Given I browse to MAGR application

  Scenario: signup notifications
    Given I ship from the "1181HZ" address in "Netherlands"
    And I ship to the "38225" address in "United States"
    And I am shipping one "FedEx Box" weighing 11 "KG"
    When I purchase a higher limit of liability
    And the carriage value is 100 "EUR"
    When I request rates
    Then I check signup message is shown for anonymous user
