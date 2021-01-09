@magr @pricebreakdown @domestic-shipping
Feature: US Domestic - FedEx packaging - One Rate
  In order to get US domestic service
  As a US domestic user
  I want to be able to choose FedEx one rates

  Background: Open application
    Given I browse to MAGR application

  Scenario: Box with unknown weight
    Given I ship from the "newyork" address in "United States"
    And I ship to the "38225" address in "United States"
    And I choose to ship with "FedEx Large Box" packaging
    And Dimensions cannot be entered for FedEx packaging or magr-lite
    And I request rates
    And FedEx One rates are shown
    When I request FedEx Retail rates
    And Enter the mandatory package weight
    Then FedEx Retail rates are shown
    And The 1 st offer price breakdown has price components in "$"
      | 0 | Base rate |
      | 1 | Fuel Surcharge |
      | 2 | Estimated Total |

  Scenario: Box that is too heavy
    Given I ship from the "newyork" address in "United States"
    And I ship to the "38225" address in "United States"
    And I choose to ship with "FedEx Large Box" packaging
    And Dimensions cannot be entered for FedEx packaging or magr-lite
    And my package weighs 21
    And I request rates
    And FedEx One rates are shown
    And The 1 st offer price breakdown has price components in "$"
      | 0 | Base rate |
      | 1 | Estimated Total |
    When I request FedEx Retail rates
    Then I get a tip the weight limit is exceeded

  Scenario: Envelope with unknown weight
    Given I ship from the "newyork" address in "United States"
    And I ship to the "38225" address in "United States"
    And I choose to ship with "FedEx Envelope" packaging
    And Dimensions cannot be entered for FedEx packaging or magr-lite
    And I request rates
    And FedEx One rates are shown
    When I request FedEx Retail rates
    And Enter the mandatory envelope weight
    Then FedEx Retail rates are shown

  Scenario: Envelope that is too heavy
    Given I ship from the "newyork" address in "United States"
    And I ship to the "38225" address in "United States"
    And I choose to ship with "FedEx Envelope" packaging
    And my package weighs 10
    And I request rates
    And FedEx One rates are shown
    When I request FedEx Retail rates
    Then I get a tip the weight limit is exceeded