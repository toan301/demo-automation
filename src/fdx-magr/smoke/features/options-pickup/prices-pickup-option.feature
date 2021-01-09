@magr @pricebreakdown @wip
Feature: Price indication for pickup option
  In order to see the price of a pickup option
  As a shipper
  I want to see it displayed when I choose the option

  Background: Open application
    Given I browse to MAGR application

  Scenario: Schedule pickup option - price
    Given I ship from the "newyork" address in "United States"
    And I ship to the "1181HZ" address in "Amstelveen"
    And I choose to ship with "FedEx Large Box" packaging
    And my package weighs 20
    And I request rates
    And rate list is shown
    And I can choose to have the shipment picked up
    And The offer is shown in "USD"
    And The 1 st offer price breakdown has price components in "$"
      | 0 | Base rate |
      | 1 | Fuel Surcharge |
      | 2 | Estimated Total |
    When I choose to have the shipment picked up
    And rate list is shown
    Then The 1 st offer price breakdown has price components in "$"
      | 0 | Base rate |
      | 1 | Fuel Surcharge |
      | 2 | FedEx pickup |
      | 3 | Estimated Total |

  Scenario: Already scheduled pickup - no price
    Given I ship from the "newyork" address in "United States"
    And I ship to the "1181HZ" address in "Amstelveen"
    And I choose to ship with "FedEx Large Box" packaging
    And my package weighs 20
    And I request rates
    And rate list is shown
    And I can choose to have the shipment picked up
    And The offer is shown in "USD"
    And The 1 st offer price breakdown has price components in "$"
      | 0 | Base rate |
      | 1 | Fuel Surcharge |
      | 2 | Estimated Total |
    When I choose to have the shipment picked up
    And rate list is shown
    And I choose I have already scheduled a pickup
    And rate list is shown
    Then The 1 st offer price breakdown has price components in "$"
      | 0 | Base rate |
      | 1 | Fuel Surcharge |
      | 2 | Estimated Total |