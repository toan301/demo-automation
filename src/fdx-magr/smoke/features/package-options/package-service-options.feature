@magr @addressbook @package-service
Feature: Services and metrics are based on origin country
  In order to ship from a country in local units and options
  As an anonymous user
  I want package options and units for weight and currency in local values

  Background: Open application
    Given I browse to MAGR application

  Scenario: US to US
    Given I ship from the "newyork" address in "United States"
    When I ship to the "38225" address in "United States"
    When I purchase a higher limit of liability
    Then my packaging options are
      | Your Packaging |
      | FedEx Envelope |
      | FedEx Extra Large Box |
      | FedEx Large Box |
      | FedEx Medium Box |
      | FedEx Pak |
      | FedEx Small Box |
      | FedEx Tube |
    And package size is preset to "IN" and weight to "LB"
    And declared value is in "USD"

  Scenario: MX to US
    Given I ship from the "tijuana" address in "Mexico"
    When I ship to the "38225" address in "United States"
    When I purchase a higher limit of liability
    Then my packaging options are
      | Your Packaging |
      | FedEx 10kg Box |
      | FedEx 25kg Box |
      | FedEx Box |
      | FedEx Envelope |
      | FedEx Pak |
      | FedEx Tube |
    And package size is preset to "CM" and weight to "KG"
    And declared value is in "NMP"

  Scenario: CA to US
    Given I ship from the "S0J2B0 Canad" address in "Canada"
    When I ship to the "38225" address in "United States"
    When I purchase a higher limit of liability
    Then my packaging options are
      | Your Packaging |
      | FedEx 10kg Box |
      | FedEx 25kg Box |
      | FedEx Box |
      | FedEx Envelope |
      | FedEx Pak |
      | FedEx Tube |
    And package size is preset to "CM" and weight to "KG"
    And declared value is in "CAD"

  Scenario: NL to BE
    Given I ship from the "hoofddorp" address in "Netherlands"
    When I ship to the "Vlamingstraat Brugge" address in "Belgium"
    When I purchase a higher limit of liability
    Then my packaging options are
      | Your Packaging |
      | FedEx 10kg Box |
      | FedEx 25kg Box |
      | FedEx Box |
      | FedEx Envelope |
      | FedEx Pak |
      | FedEx Tube |
    And package size is preset to "CM" and weight to "KG"
    And declared value is in "EUR"


