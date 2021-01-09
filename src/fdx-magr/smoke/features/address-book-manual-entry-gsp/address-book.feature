@addressbook @login
Feature: Ship using address book
  As a user
  I want to ship quickly

  Background: Open application
    Given I browse to MAGR application
    Given As a "MAGICJAPAN" user I login to MAGR full

  Scenario: as a logged-in user using addressbook for FROM and TO section
    And I enter sender as "Brazil" and select "Brazil Sender" from autocompletelist in "BR"
    And I enter recipient as "test" and select "TEST SHIMADA" from autocompletelist in "US"
    When I purchase a higher limit of liability
    And I am shipping one "FedEx Box" weighing 11 "KG"
    And the carriage value is 100 "JPY"
    When I request rates
    Then rate list is shown

  Scenario: updating sender and recipient name also updates FROM and TO section
    And I enter recipient as "test" and select "TEST SHIMADA" from autocompletelist in "US"
    When I purchase a higher limit of liability
    And I am shipping one "FedEx Box" weighing 11 "KG"
    And the carriage value is 100 "JPY"
    When I request rates
    And rate list is shown
    When I enter sender as "sen" and select "CA Sender" from autocompletelist in "CA"
    When I enter recipient as "br" and select "Brazil" from autocompletelist in "BR"
    And I am shipping one "FedEx Box" weighing 11 "KG"
    And the carriage value is 100 "CAD"
    When I request rates
    Then rate list is shown

   Scenario: updating recipient name also updates FROM section
    And I enter recipient as "test" and select "TEST SHIMADA" from autocompletelist in "US"
    And I enter recipient as "Shri" and select "Shrikant UK" from autocompletelist in "GB"
    When I purchase a higher limit of liability
    And I am shipping one "FedEx Box" weighing 11 "KG"
    And the carriage value is 100 "USD"
    When I request rates
    And rate list is shown

  Scenario: using receipient address book and manual address search
    Given I ship from the "iraq" address in "Iraq"
    And I see option to reset manual address in "Sender" section
    And I select "Iceland" as "origin" from list of countries
    And I select "Baer" as "origin" city
    And I enter recipient as "test" and select "TEST SHIMADA" from autocompletelist in "US"
    When I continue to ship using manual address search
    When I purchase a higher limit of liability
    And my package weighs 12
    And the carriage value is 200 "USD"
    And I request rates
    Then rate list is shown

  Scenario: Validate SENDER NAME is prefilled after user logging in
    Given As a "MAGICJAPAN" user I login to MAGR full
    Then I should see the SENDER NAME pre-filled

  Scenario: Validate SENDER NAME is prefilled, even if field is cleared and page is refreshed
    Given As a "MAGICJAPAN" user I login to MAGR full
    Then I should see the SENDER NAME pre-filled
    When I delete the SENDER NAME and refresh page
    Then I should see the SENDER NAME pre-filled