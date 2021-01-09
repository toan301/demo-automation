@magr @pricebreakdown @international-shipping
Feature: US Rest of the World - Only Retail prices
  In order to ship world wide from the US
  As a US shipper
  I want to be able to get Retail price rates

  Background: Open application
    Given I browse to MAGR application

  Scenario: For FedEx packaging
    Given I ship from the "newyork" address in "United States"
    And I ship to the "1181HZ" address in "Netherlands"
    And I choose to ship with "FedEx Large Box" packaging
    And Dimensions cannot be entered for FedEx packaging or magr-lite
    And my package weighs 20
    And I request rates
    When rate list is shown
    Then FedEx One rates are not available
    And The 1 st offer price breakdown has price components in "$"
      | 0 | Base rate |
      | 1 | Fuel Surcharge |
      | 2 | Estimated Total |

  @login
  Scenario: For Your packaging and rates for us-canada
    Given As a "MAGICJAPAN" user I login using cookie from L6 env
    And I ship from the "newyork" address in "United States"
    And I ship to the "toronto" address in "Canada"
    And I want to ship with my own packaging
      | length | width | height | weight |
      | 11     | 11    | 11     | 22     |
    And I request rates
    When rate list is shown
    Then FedEx One rates are not available
