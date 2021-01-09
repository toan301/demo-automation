@Tacocat @mock
#@magr-550411
Feature: Ship from GSP countries where fedex has no direct service
  As a user
  I want to ship

  Background: MAGR application
    Given I go to MAGR app

    #  Intra UK for USA user and should see GB account required for UK domestic rates
  Scenario: from gsp country without seeing rates
    Given I ship from the "Athens, Greece" address in "Greece"
    And I ship to the "38225 Camino" address in "USA"
    And I am shipping one "YOUR_PACKAGING" weighing 11 "KG"
    And the carriage value is 100 "EUR"
    When I request rates
    And I see AMOUNTS ARE SHOWN label is not displayed over rate section
    Then I see SHIP label is shown in quotes

  Scenario: from gsp country and see rates
    Given I ship from the "Hanoi, Vietnam" address in "Vietnam"
    And I ship to the "38225 Camino" address in "USA"
    And I am shipping one "YOUR_PACKAGING" weighing 9 "KG"
    And the carriage value is 100 "EUR"
    When I request rates
    And I see AMOUNTS ARE SHOWN label is displayed over rate section
    Then I see SHIP label is not shown in quotes

  Scenario: as a GSP logged-in user from gsp country
    Given As a "GspAFAccount" user I login locally into MAGR
    And I ship from the "Embilipitiya - Middeniya Road, Hambantota, Sri Lanka " address in "Sri Lanka"
    And I ship to the "38106 Farm to Market" address in "United States"
    Then I am shipping one "FEDEX_BOX" weighing 11 "KG"
    And the carriage value is 70 "USD"
    When I request rates
    And I see AMOUNTS ARE SHOWN label is not displayed over rate section
    Then I see SHIP label is shown in quotes

  Scenario: as a GSP logged-in user from gsp country
    Given As a "GspALAccount" user I login locally into MAGR
    And I ship from the "560078, India" address in "India"
    And I ship to the "90003 CALIFORNIA" address in "United States"
    Then I am shipping one "YOUR_PACKAGING" weighing 10 "KG"
    And I am shipping Dimensions L x W x H as "10" x "20" x "55" unit "CM"
    And the carriage value is 88 "EUR"
    When I request rates
    And I see AMOUNTS ARE SHOWN label is not displayed over rate section
    Then I see SHIP label is shown in quotes

  Scenario: as a Non-GSP logged-in user from gsp country
    Given As a "Magsregister" user I login locally into MAGR
    And I ship from the "Embilipitiya - Middeniya Road, Hambantota, Sri Lanka " address in "Sri Lanka"
    And I ship to the "38106 Farm to market" address in "USA"
    Then I am shipping one "FEDEX_BOX" weighing 11 "KG"
    And the carriage value is 77 "USD"
    When I request rates
    And I see AMOUNTS ARE SHOWN label is not displayed over rate section
    Then I see SHIP label is shown in quotes
