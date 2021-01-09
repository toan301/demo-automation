@magr @domestic-shipping
Feature: US Domestic - Your Packaging - Retail Rate
  In order to get US domestic service
  As a US domestic user
  I want to be able to choose FedEx one rates

  Background: Open application
    Given I browse to MAGR application

  Scenario: Defaults to Retail with hint for One
    Given I ship from the "newyork" address in "United States"
    And I ship to the "38224" address in "United States"
    And I want to ship with my own packaging
      |length | width | height | weight |
      |   11  |  11   |   11   |   22   |
    When I request rates
    And FedEx Retail rates are shown
    And rate list is shown
    And I request FedEx One rates
    Then I get a tip to choose FedEx packaging
