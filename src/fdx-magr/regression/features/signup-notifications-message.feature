@Tacocat @mock

Feature: Signup notifications message
         In order to get quotes
         As a user
         I want to get quote
  Background: MAGR application
    Given I go to MAGR app

  Scenario: signup notifications
    Given I ship from the "1181HZ" address in "Netherlands"
    And I ship to the "38225 Camino" address in "USA"
    And I am shipping one "FEDEX_BOX" weighing 11 "KG"
    And the carriage value is 100 "EUR"
    When I request rates
    Then I check signup message is shown for anonymous user
