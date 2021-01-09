@magr @domestic-shipping
Feature: Domestic shipping not allowed and other exceptions
  In order to ship domestically in some countries
  As a user
  I want to be directed to login on the anonymous rate app

  Background: Open application
    Given I browse to MAGR application

  Scenario: For PL on anonymous site
    And I ship from the "Warszawa" address in "Poland"
    When I ship to the "torun" address in "Poland"
    Then I see that intra-country message is shown

  Scenario: For UK on anonymous site
    And I ship from the "Westminster, Londen SW1A 0AA" address in "United Kingdom"
    When I ship to the "Canal Street Manchester" address in "United Kingdom"
    Then I see a message that in "GB" domestic shipping is not allowed

  @login
  Scenario: For UK with Logged-in regular user
    And As a "MAGICJAPAN" user I login using cookie from L6 env
    And I ship from the "Westminster, Londen SW1A 0AA" address in "United Kingdom"
    When I ship to the "Canal Street Manchester" address in "United Kingdom"
    Then I see a message that in "GB" domestic shipping is not allowed

  @login
  Scenario: For UK with uk-enabled user
    And As a "UKENABLEDUSER" user I login using cookie from L6 env
    And I ship from the "Westminster, Londen SW1A 0AA" address in "United Kingdom"
    When I ship to the "Canal Street Manchester" address in "United Kingdom"
    And I am shipping one "FedEx UK Pak" weighing 9 "KG"
    When I request rates
    Then rate list is shown
  # below scenarios are commented out because users don't work anymore
  # Scenario: for regular user intra india
  #   And As a "RegularUser" user I login using cookie from L6 env
  #   And I ship from the "bangalore" address in "India"
  #   When I ship to the "newdelhi" address in "India"
  #   And my package weighs 20
  #   When I request rates
  #   Then rate list is shown

  #  Scenario: for Departmental user
  #   And As a "DeptAdminUser" user I login using cookie from L6 env
  #   And I ship from the "Sydney" address in "Australia"
  #   When I ship to the "capetown" address in "South Africa"
  #   And I am shipping one "FedEx Pak" weighing 9 "KG"
  #   When I request rates
  #   Then rate list is shown

