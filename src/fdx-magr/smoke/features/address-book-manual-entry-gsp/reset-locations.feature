@addressbook @reset-address
Feature: Defects in application
  As a user
  I want to be able to reset destinations
  After my initial search

    Background: Open application
        Given I browse to MAGR application

    Scenario: Validate user sees continue button
        Given I ship from the "China" address in "China"
        And I select "United States" as "origin" from list of countries
        And I enter "ZIP" code "38225" as "origin"
        And I ship to the "1063MC" and select "1063 MC Amsterdam, Netherlands" from autocompletelist in "Netherlands"
        Then I should see continue button

    Scenario: Validate user sees button after changing initial origin search, using manual dropdown
        Given I ship from the "1063MC" and select "1063 MC Amsterdam, Netherlands" from autocompletelist in "Netherlands"
        And I ship to the "Iraq" address in "Iraq"
        And I select "United States" as "destination" from list of countries
        And I enter "ZIP" code "38225" as "destination"
        Then I should see continue button

    Scenario: Validate user sees button after changing initial origin and destination searches, using manual dropdown
        Given I ship from the "China" address in "China"
        And I enter "POSTAL" code "323000" as "origin"
        And I ship to the "1063mc" and select "1063 MC Amsterdam, Netherlands" from autocompletelist in "Netherlands"
        Then I should see continue button
        And I select "Iraq" as "origin" from list of countries
        And I select "Anbar" as "origin" city
        And I ship to the "China" address in "China"
        And I enter "POSTAL" code "323000" as "destination"
        Then I should see continue button

    Scenario: Validate user sees button after changing initial origin, using manual dropdown
        Given I ship from the "Iraq" address in "Iraq"
        And I select "Italy" as "origin" from list of countries
        And I enter "POSTAL" code "46047" as "origin"
        And I ship to the "1063MC" and select "1063 MC Amsterdam, Netherlands" from autocompletelist in "Netherlands"
        Then I should see continue button

    Scenario: Validate user able to Reset Origin, and changing initial origin search, using autocomplete
        Given I ship from the "Iraq" address in "Iraq"
        And I select "Italy" as "origin" from list of countries
        And I enter "POSTAL" code "46047" as "origin"
        And I ship to the "1063MC" and select "1063 MC Amsterdam, Netherlands" from autocompletelist in "Netherlands"
        Then I should see continue button
        When I select reset origin
        And I ship from the "1063MC" and select "1063 MC Amsterdam, Netherlands" from autocompletelist in "Netherlands"
        Then I should see showrates button

    Scenario: Validate user able to Reset Origin, and changing initial destination search, using autocomplete
        Given I ship from the "Iraq" address in "Iraq"
        And I select "Italy" as "origin" from list of countries
        And I enter "POSTAL" code "46047" as "origin"
        And I ship to the "Iraq" address in "Iraq"
        And I select "Anbar" as "to" city
        Then I should see continue button
        When I select reset destination
        And I ship to the "Les Escaldes, Andorra" address in "Andorra"
        Then I should see continue button
