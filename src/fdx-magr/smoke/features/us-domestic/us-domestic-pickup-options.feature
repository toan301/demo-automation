@magr @domestic-shipping
Feature: US Domestic - Pickup options
    In order to a schedule pickup
    As a US shipper
    I want to be able to select US pickup options

    Background: Open application
        Given I browse to MAGR application

  Scenario: shows already scheduled pickup option
    Given I ship from the "newyork" address in "United States"
    And I ship to the "38225" address in "United States"
    And I am shipping one "FedEx Medium Box" weighing 12 "LB"
    And Dimensions cannot be entered for FedEx packaging or magr-lite
    And I request rates
    And rate list is shown
    When I can choose to have the shipment picked up
    And I choose to have the shipment picked up
    And rate list is shown
    Then I can choose I already have a scheduled pickup

  @fail
  Scenario: us domestic with manual entry
    Given I ship from the "Iraq" address in "Iraq"
    Then I see option to reset manual address in "Sender" section
    When I continue to ship using manual address search in "From" section
    And I select "United States" as "origin" from list of countries
    Then I do not see error message when using a correct postal code "10000" in From section
    When I ship to the "38225" address in "United States"
    And I am shipping one "FedEx Medium Box" weighing 12 "LB"
    And Dimensions cannot be entered for FedEx packaging or magr-lite
    And I request rates
    And rate list is shown
    When I can choose to have the shipment picked up
    And I choose to have the shipment picked up
    And rate list is shown
    Then I can choose I already have a scheduled pickup
