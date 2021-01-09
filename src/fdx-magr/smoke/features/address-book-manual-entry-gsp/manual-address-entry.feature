@manual-address-search @addressbook
Feature: Support manual address entry
  As a user
  I want to get quote

  Background: Open application
    Given I browse to MAGR application

  Scenario: for countries in To section that do not support GA data
    Given I ship from the "iraq" address in "Iraq"
    And I see option to reset manual address in "Sender" section
    And I select "Iceland" as "origin" from list of countries
    And I see option to enter manual address in "From" section
    And I select "Baer" as "origin" city
    And I ship to the "3452AS" address in "Netherlands"
    When I continue to ship using manual address search
    When I purchase a higher limit of liability
    And my package weighs 12
    And the carriage value is 200 "USD"
    And I click Transit button
    Then rate list is shown

  Scenario: for countries in To and From section that do not support GA data
    Given I ship from the "iraq" address in "Iraq"
    And I see option to reset manual address in "Sender" section
    And I select "Iceland" as "origin" from list of countries
    And I select "Baer" as "origin" city
    And I ship to the "iceland" address in "Iceland"
    And I see option to reset manual address in "Recipient" section
    And I select "United States" as "destination" from list of countries
    # And I enter "ZIP" code "1234" as "destination"
    # Then I see error message " ZIP code is required. " for "destination" postcode
    # Then I see error message " ZIP code must be 5 characters. " for "destination" postcode
    And I enter "ZIP" code "38106" as "destination"
    When I continue to ship using manual address search
    When I purchase a higher limit of liability
    And my package weighs 12
    And the carriage value is 200 "USD"
    And I click Transit button
    Then rate list is shown


    Scenario: Validate that the Continue button is visible after using the reset SENDER option
    Given I ship from the "iraq" address in "Iraq"
    And I see option to enter manual address in "From" section
    And I select "Al Asad Airbase" as "origin" city
    And I ship to the "Canal Street Manchester" address in "United Kingdom"
    And I continue to ship using manual address search
    And I select reset origin
    And I ship from the "taiwan" address in "Taiwan"
    And I select "Lo Dong" as "origin" city
    And I continue to ship using manual address search

  Scenario: Validate that the Continue button is visible after using the reset SENDER option
    Given I ship from the "iraq" address in "Iraq"
    And I see option to enter manual address in "From" section
    And I select "Al Asad Airbase" as "origin" city
    And I ship to the "Canal Street Manchester" address in "United Kingdom"
    And I continue to ship using manual address search
    And I select reset origin
    And I ship from the "Taiwan" address in "Taiwan"
    And I select "Lo Dong" as "origin" city
    And I continue to ship using manual address search
    And I select reset origin
    And I ship from the "iraq" address in "Iraq"
    And I see option to enter manual address in "From" section
    And I select "Al Asad Airbase" as "origin" city
    And I ship to the "Canal Street Manchester" address in "United Kingdom"
    And I continue to ship using manual address search


  