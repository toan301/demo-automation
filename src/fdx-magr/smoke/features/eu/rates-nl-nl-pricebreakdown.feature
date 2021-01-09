@magr @pricebreakdown
Feature: Price indication for NL-NL shipment
  In order to see the price of a NL-NL shipment
  As a shipper
  I want to see it displayed when I choose the option

  Background: Open application
    Given I browse to MAGR application

  Scenario: View price breakdown
    Given I ship from the "1181HZ" address in "Netherlands"
    And I ship to the "3452AS" address in "Netherlands"
    When I purchase a higher limit of liability
    And I want to ship with my own packaging
      |length | width | height | weight |
      |   11  |  11   |   11   |   12   |
    And the carriage value is 100 "EUR"
    And I request rates
    And rate list is shown
    And The 1 st offer price breakdown has price components in "€"
      | 0 | Base rate |
      | 1 | Netherlands VAT |
      | 2 | Fuel Surcharge |
      | 3 | Declared Value |
      | 4 | Estimated Total |