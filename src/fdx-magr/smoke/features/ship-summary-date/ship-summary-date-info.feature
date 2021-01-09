@magr-558588 @addressbook @summary-date
Feature: verify ship date and summary
  In order to ship a shipment
  As a user I want to

  Background: Open application
    Given I browse to MAGR application

  Scenario: see ship date time
    Given I ship from the "1181HZ" address in "Netherlands"
    And I ship to the "38225" address in "United States"
    And I am shipping one "FedEx Box" weighing 11 "KG"
    And I choose ship date from list row 1
    When I request rates
    And I see selected ship date matches date in ship summary
    And I choose ship date from list row 2
    When I request rates
    And I see selected ship date matches date in ship summary

  Scenario: verify shipment summary
    Given I ship from the "1181HZ" address in "Netherlands"
    And I ship to the "38225" address in "United States"
    And I am shipping one "FedEx Box" weighing 11 "KG"
    When I request rates
    Then rates and delivery information is shown to the "anonymous" user

  @login
  Scenario: verify shipment summary for Logged-in user
    Given As a "MAGICJAPAN" user I login using cookie from L6 env
    And I ship from the "1181HZ" address in "Netherlands"
    And I ship to the "38225" address in "United States"
    And I am shipping one "FedEx Box" weighing 11 "KG"
    When I request rates
    Then rates and delivery information is shown to the "Loggedin" user
