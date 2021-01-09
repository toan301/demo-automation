@magr-550411 @gsp-check @login
Feature: Ship from GSP countries where fedex has no direct service
  As a user
  I want to ship

  Background: Open application
    Given I browse to MAGR application

  Scenario: from gsp country without seeing rates
    Given I ship from the "athens" address in "Greece"
    And I ship to the "38225" address in "United States"
    When I purchase a higher limit of liability
    And I am shipping one "FedEx Box" weighing 11 "KG"
    And the carriage value is 100 "EUR"
    When I request rates
    And I see AMOUNTS ARE SHOWN label is not displayed over rate section
    Then I see SHIP label is shown in quotes

  Scenario: from gsp country and see rates
    Given I ship from the "Hanoi" address in "Vietnam"
    And I ship to the "38225" address in "United States"
    When I purchase a higher limit of liability
    And I am shipping one "FedEx Box" weighing 11 "KG"
    And the carriage value is 100 "EUR"
    When I request rates
    And I see AMOUNTS ARE SHOWN label is displayed over rate section
    Then I see SHIP label is not shown in quotes

  @fail @login
  Scenario: as a logged-in user from gsp country
    Given As a "MAGICJAPAN" user I login using cookie from L6 env
    And I ship from the "athens" address in "Greece"
    And I ship to the "38225" address in "United States"
    When I purchase a higher limit of liability
    And I am shipping one "FedEx Box" weighing 11 "KG"
    And the carriage value is 100 "EUR"
    When I request rates
    And I see AMOUNTS ARE SHOWN label is not displayed over rate section
    Then I see SHIP label is shown in quotes