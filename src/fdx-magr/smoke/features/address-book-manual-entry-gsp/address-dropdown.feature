@addressbook @login
Feature: From / To senarios - Automate address dropdown

  Background: Open application
    Given I browse to MAGR application

  Scenario: I’m not logged in and I’m opening the MAGR app
    Then empty From and To fields are shown
  
  # @manualtests
  # Scenario: I’m logged in and I’m opening the MAGR app
  #   Given I browse to MAGR application
  #   Given As a "MAGICJAPAN" user I login locally using one of the tests env
  #   Then my name is pre-filled
  #   And my sender address is pre-filled
  #   And empty <Receiver name> and <Receiver address> fields are shown 

  Scenario: I’m not logged in and I’m opening the MAGR lite app
    Given I browse to MAGR lite application
    Then empty From and To fields are shown

  # @manualtests
  # Scenario: I’m logged in and I’m opening the MAGR app lite app
  #   Given I’m already logged in
  #   When I open the MAGR app
  #   Then my address is pre-filled 
  #   And an empty <From> field is shown

  Scenario: I want a rate and I don’t know precisely from where to where
    Given I browse to MAGR application
    When I enter "random character" into "From"
    Then I should see the app proposes a list of possible locations in "From" field
    When I choose first proposed option in autocomplete form
    Then I should see the app shows that location in the "From" field
    When I enter "random character" into "To"
    Then I should see the app proposes a list of possible locations in "To" field
    When I choose first proposed option in autocomplete form
    Then I should see the app shows that location in the "To" field

  Scenario: I want to manually enter the location for a country requiring postal/zip codes
    Given I browse to MAGR application
    When I enter "random characters" into "From"
    And I should see the app proposes a list of possible locations in "From" field
    When I click Enter the Address Yourself button
    Then I should see the app shows "United States" as country in "From" field
    Then I should see the app shows "empty" as zipcode in "From" field
    When I enter "random characters" into "To"
    And I should see the app proposes a list of possible locations in "To" field
    When I click Enter the Address Yourself button
    Then I should see the app shows "United States" as country in "From" field
    Then I should see the app shows "empty" as zipcode in "To" field

  Scenario: I want to manually enter the location for a country not requiring postal/zip codes
    Given I browse to MAGR application
    When I enter "random characters" into "From"
    And I should see the app proposes a list of possible locations in "From" field
    When I click Enter the Address Yourself button
    And I select "Iceland" as "origin" from list of countries
    Then I should see the app shows "empty" as manual city in "From" field
    When I enter "random characters" into "To"
    And I should see the app proposes a list of possible locations in "To" field
    When I click Enter the Address Yourself button
    And I select "Iceland" as "To" from list of countries
    Then I should see the app shows "empty" as manual city in "To" field

  Scenario: The system doesn’t propose a location
    Given I browse to MAGR application
    When I enter "false location to test" into "From"
    Then the app only shows me the possibility the enter a location manually in "From" field
    When I enter "false location to test" into "To"
    Then the app only shows me the possibility the enter a location manually in "To" field

  Scenario: I want to edit an already entered location after reaching the package section
    Given I browse to MAGR application
    And I ship from the "New Orleans" address in "United States"
    And I ship to the "Canal Street Manchester" address in "United Kingdom"
    Then The package section is "appeared"
    When I clear "From" field
    Then The package section is "disappeared"
    And I ship from the "iceland" address in "Iceland"
    And I select "Baer" as "origin" city
    And I ship to the "Canal Street Manchester" address in "United Kingdom"
    And I should see Continue button

  Scenario: I want to edit a manually selected country after reaching the package section
    Given I browse to MAGR application
    And I ship from the "Iraq" address in "Iraq"
    And I select "Baghdad" as "origin" city
    And I ship to the "Canal Street Manchester" address in "United Kingdom"
    Then The package section is "appeared"
    When I select "Iceland" as "origin" from list of countries
    Then The package section is "disappeared"
    When I should see the app shows "empty" as manual city in "From" field
    And I select "Baer" as "origin" city
    Then I should see Continue button
    When I select "Luxembourg" as "origin" from list of countries
    Then The package section is "disappeared"
    When I should see the app shows "empty" as zipcode in "From" field
    And I enter "ORIGIN POSTAL CODE" code "4433" as "origin"
    Then I should see Continue button

  @fail
  Scenario: I want to edit a manually entered postal/zip code or city after reaching the package section
    Given I browse to MAGR application
    And I ship from the "Iraq" address in "Iraq"
    When I select "Luxembourg" as "origin" from list of countries
    And I enter "ORIGIN POSTAL CODE" code "4433" as "origin"
    And I ship to the "Canal Street Manchester" address in "United Kingdom"
    And I continue to ship using manual address search
    Then The package section is "appeared"
    When I clear "From Manual Postal Code" field
    Then The package section is "disappeared"
    When I enter "ORIGIN POSTAL CODE" code "4332" as "origin"
    And I should see Continue button
    When I select "Iceland" as "origin" from list of countries
    And I select "Baer" as "origin" city
    And I continue to ship using manual address search
    Then The package section is "appeared"
    When I clear "From Manual City" field
    Then The package section is "disappeared"
    And I select "Bildudalur" as "origin" city
    And I should see Continue button

  # Need clarification from Hamza
  @fail
  Scenario: I want to reset the manual input
    Given I browse to MAGR application
    And I ship from the "Iraq" address in "Iraq"
    And I select "Baghdad" as "origin" city
    When I select reset origin
    Then I saw "city" of "From" field is not displayed
    And I should see the app proposes a list of possible locations in "From" field
    And The dropdown of "From" field shows results that match the "Iraq"

  Scenario: Continue
    Given I browse to MAGR application
    And I ship from the "Iraq" address in "Iraq"
    When I select "Luxembourg" as "origin" from list of countries
    And I enter "ORIGIN POSTAL CODE" code "4433" as "origin"
    And I ship to the "Canal Street Manchester" address in "United Kingdom"
    Then I should see Continue button

  Scenario: I’m alerted if FedEx doesn’t serve the location I want to send from and/or to
    Given I browse to MAGR application
    When I ship from the "Iran" address in "Iran"
    Then I should see warning Fedex does not service message in "From" field
    When I ship to the "Iran" address in "Iran"
    Then I should see warning Fedex does not service message in "To" field

  Scenario: I’m alerted if I forgot to fill out the From and/or To field(s)
    Given I browse to MAGR application
    When I interact with the app outside of the "From" field
    Then I should see warning Address Required Message in "From" field
    When I interact with the app outside of the "To" field
    Then I should see warning Address Required Message in "To" field