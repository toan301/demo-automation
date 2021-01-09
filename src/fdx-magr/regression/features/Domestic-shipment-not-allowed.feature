@Tacocat @mock @manual-address-search
Feature: Domestic Shipment not allowed
  As a user
  I want to

  Background: MAGR application
    Given I browse to MAGR application

#   Intra UK anonymous scenario
  Scenario: For UK on anonymous site
    And I ship from the "Westminster, London SW1A 0AA" address in "United Kingdom"
    When I ship to the "Canal Street, Manchester" address in "United Kingdom"
    Then I see a message that in "GB" domestic shipping is not allowed

#   Intra UK anonymous scenario with manual flow
  Scenario: For UK on anonymous site manual flow
    Given I browse to MAGR application
    When I enter "@#$%" in "From" field and proceed to manual entry
    When I enter "@#$%" in "To" field and proceed to manual entry
    And I select "United Kingdom" as "origin" from list of countries
    Then I enter "ORIGIN POSTAL CODE" code "L10AJ" as "origin"
    And I select "United Kingdom" as "to" from list of countries
    And I enter "DESTINATION POSTAL CODE" code "E17AA" as "To"
    And I see a message that in "GB" domestic shipping is not allowed

#  Intra UK for USA user and should see GB account required for UK domestic rates
#   Username for loggin is not defined
  @fail
  Scenario: For Intra UK with USA loggedIn user
    Given As a "Magsregister" user I login locally using one of the tests env
    When I ship from the "Westminster, London SW1A 0AA" address in "United Kingdom"
    And I ship to the "Canal Street, Manchester" address in "United Kingdom"
    Then I see a message that in "GB" domestic shipping is not allowed

#  Intra UK for UK domestic enabled user and should see rates
#   Username for loggin is not defined
  @fail
  Scenario: For Intra UK with UK Domestic enabled loggedIn user should get rates
    Given As a "UKDomesticUser" user I login locally using one of the tests env
    When I ship to the "Canal Street, Manchester" address in "United Kingdom"
    And I ship from the "Westminster, London SW1A 0AA" address in "United Kingdom"
    Then I should not see any message domestic shipping not allowed for uk domestic account
    And I am shipping one "YOUR_PACKAGING" weighing 9 "KG"
    And the carriage value is 100 "GBP"
    When I request rates
    Then I see AMOUNTS ARE SHOWN label is displayed over rate section

#    Intra poland scenario should encounter system error pop up
  Scenario: For Poland on anonymous site
    Given I ship from the "Skórka, 95-045, Poland" address in "Poland"
    When I ship to the "Skórka, 95-045, Poland" address in "Poland"
    Then I see that intra-country message is shown
