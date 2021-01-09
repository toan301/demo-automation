@magr @signature-options @addressbook
Feature: Anonymous signature option
  In order to see the price of a signature option
  As a shipper
  I want to choose an option with a quote

  Background: Open application
    Given I browse to MAGR application

  @fail
  Scenario: Default service_default is available
    Given I ship from the "1181HZ" address in "Netherlands"
    And I ship to the "3452AS" address in "Netherlands"
    When I purchase a higher limit of liability
    And I want to ship with my own packaging
     |length | width | height | weight |
     |   11  |  11   |   11   |   12   |
    And the carriage value is 100 "EUR"
    And I request rates
    When I view signature options I see "SERVICE_DEFAULT" is selected
    And rate list is shown

  @fail
  Scenario: For Fedex Box and check signature options
    Given I ship from the "1181HZ" address in "Netherlands"
    And I ship to the "3452AS" address in "Netherlands"
    When I purchase a higher limit of liability
    And I am shipping one "FedEx Box" weighing 12 "KG"
    And the carriage value is 200 "EUR"
    When I request rates
    When I view signature options I see "SERVICE_DEFAULT" is selected
    And rate list is shown
