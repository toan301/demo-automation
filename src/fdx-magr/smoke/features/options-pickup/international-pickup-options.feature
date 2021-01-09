@magr @pricebreakdown @international-pickup
Feature: International pickup options
  In order to support pickup options per country
  As a user
  I want to get the option if it is offered in the country

  Background: Open application
    Given I browse to MAGR application

  @fail
  Scenario: Available  - NL pickup
    Given I ship from the "1181HZ" address in "Netherlands"
    And I ship to the "38225" address in "United States"
    And I am shipping one "FedEx Box" weighing 12 "KG"
    When I request rates
    Then I can choose to have the shipment picked up
    And The offer is shown in "EUR"
    And The 1 st offer price breakdown has price components in "€"
      | 0 | Base rate |
      | 1 | Fuel Surcharge |
      | 2 | Peak Surcharge  |
      | 3 | Estimated Total |

  Scenario: Not available - Russia pickup
    Given I ship from the "moscow" address in "Russia"
    And I ship to the "38225" address in "United States"
    And I am shipping one "FedEx Box" weighing 12 "KG"
    When I request rates
    Then I cannot choose to have the shipment picked up


Scenario Outline: Validate shipping from blacklisted locale, where both origins/destinations are whitelisted
  Given I browse to MAGR application
  And I clear all cookies
  And I set the cookie "<locale>"
  And I refresh page
  When I ship from the "Manchester, UK" address in "United Kingdom"
  And I ship to the "Sydney Australia" address in "Australia"
  And I am shipping one "FedEx Box" weighing 12 "KG"
  When I request rates
  Then I can choose to have the shipment picked up
  Examples:
    |locale|
    |en_KH|
    |en_BN|

Scenario Outline: Validate Pickup options not visible, from blacklisted origin
  Given I browse to MAGR application
  And I clear all cookies
  And I set the cookie "en_JP"
  And I refresh page
  When I ship from the "<originCity>" address in "<originCountry>"
  And I ship to the "Sydney Australia" address in "Australia"
  And I am shipping one "FedEx Box" weighing 12 "KG"
  And I click Transit button
  Then I cannot choose to have the shipment picked up
  Examples:
    |originCity                  | originCountry|
    |Phnom Penh, Cambodia        | Cambodia     |
    |Bandar Seri Begawan, Brunei | Brunei       |


Scenario Outline: Validate Pickup Option is visible, to black listed destinations
  Given I browse to MAGR application
  And I clear all cookies
  And I set the cookie "<locale>"
  And I refresh page
  When I ship from the "Manchester, UK" address in "United Kingdom"
  And I ship to the "<destinationCity>" address in "<destinationCountry>"
  And I am shipping one "FedEx Box" weighing 12 "KG"
  When I request rates
  Then I can choose to have the shipment picked up
  Examples:
    |locale|destinationCity             | destinationCountry|
    |en_KH |Phnom Penh, Cambodia        | Cambodia          |
    |en_BN |Bandar Seri Begawan, Brunei | Brunei            |