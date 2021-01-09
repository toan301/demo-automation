@magr @pricebreakdown
Feature: EU shipment with FedEx packaging
  In order to get US domestic service
  As a US domestic user
  I want to be able to choose FedEx one rates

  Scenario: FedEx 25kg Box
    Given I browse to MAGR application
    And I ship from the "Haagweg" address in "Netherlands"
    And I ship to the "Pariser Platz" address in "Germany"
    And I am shipping one "FedEx 25kg Box" weighing 12 "KG"
    And Dimensions cannot be entered for FedEx packaging or magr-lite
    When I request rates
    Then rate list is shown