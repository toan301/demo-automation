@Tacocat @mock
#@magr
#@manual-addressEntry
Feature: Support manual address entry
  As a user
  I want to get quote


  Background: MAGR application
    Given I browse to MAGR application

  Scenario: for countries that do not support GA data
    Given I enter "@#$%" in "From" field and proceed to manual entry
    When I select "Iraq" as "origin" from list of countries
    And I select "Baghdad" as "origin" city
    And I ship to the "3452AS" address in "Netherlands"
    When I continue to ship using manual address search
    And I purchase a higher limit of liability
    And I am shipping one "FEDEX_BOX" weighing 11 "KG"
    And the carriage value is 200 "USD"
    And I click Transit button
    Then rate list is shown

  Scenario: verify default country lands to locale specific in manual flow
    Given I set the cookie "en_JP"
    And I browse to MAGR application
    Then I enter "@#$%" in "From" field and proceed to manual entry
    Then I see "Japan" in manual "From" field
    When I set the cookie "en_AU"
    And I browse to MAGR application
    Then I enter "@#$%" in "To" field and proceed to manual entry
    Then I see "Australia" in manual "To" field
    And I enter "DESTINATION POSTAL CODE" code "3352" as "To"
    And I ship from the "Westminster, Londen SW1A 0AA" address in "United Kingdom"
    And I continue to ship using manual address search
    And I am shipping one "FEDEX_TUBE" weighing 9 "KG"
    And I choose ship date from list row 1
    When I request rates
    And I see selected ship date matches date in ship summary
    And I choose ship date from list row 2
    When I request rates
    And I see selected ship date matches date in ship summary
    Then I see view signature options along with i want shipment picked up checkbox
    When I check View signature options
    And I want the "DIRECT" signature option for my shipment
    Then I see AMOUNTS ARE SHOWN label is displayed over rate section
    And rate list is shown
    Then The 1 st offer price breakdown has price components in "GBP"
      | 0 | Base rate |
      | 1 | Direct signature required |
      | 2 | Fuel Surcharge |
      | 3 | Out of delivery area |
      | 4 | Estimated Total |

  Scenario Outline: verify rates for for anonymous user with origin and destination combinations in Manual flow - optional
    When I enter "@#$%" in "From" field and proceed to manual entry
    When I enter "@#$%" in "To" field and proceed to manual entry
    And I select "<fromCountry>" as "origin" from list of countries
    Then I select "<fromCity>" as "origin" city
    And I select "<toCountry>" as "To" from list of countries
    Then I select "<toCity>" as "To" city
    And I continue to ship using manual address search
    Then I see default selected package type should be "Your Packaging"
    When I am shipping one "YOUR_PACKAGING" weighing 20 "LB"
    And I want to ship 2 packages
    Then I should see total package is "2"
    And I should see total weight is "40 LB"
    When I choose ship date from list row 2
    And I request rates
    Then I see selected ship date matches date in ship summary
    And The rate list is displayed
    Examples:
      | fromCity  | fromCountry | toCity    | toCountry |
      | Central   | Hong Kong SAR, China  | Diani     | Kenya     |
      | Abel      | Argentina   | Abu Samra | Qatar     |

  Scenario Outline: verify transit for for anonymous user with origin and destination combinations in Manual flow - optional
    When I enter "@#$%" in "From" field and proceed to manual entry
    When I enter "@#$%" in "To" field and proceed to manual entry
    And I select "<fromCountry>" as "origin" from list of countries
    Then I select "<fromCity>" as "origin" city
    And I select "<toCountry>" as "To" from list of countries
    Then I select "<toCity>" as "To" city
    And I continue to ship using manual address search
    Then I see default selected package type should be "Your Packaging"
    When I am shipping one "YOUR_PACKAGING" weighing 20 "LB"
    And I want to ship 2 packages
    Then I should see total package is "2"
    And I should see total weight is "40 LB"
    When I choose ship date from list row 2
    And I click Transit button
    Then The rate list is displayed
    Examples:
      | fromCity  | fromCountry | toCity    | toCountry |
      | Thimphu   | Bhutan      | Ariana    | Tunisia   |
      | Carrefour | Haiti       | Al Saadah | Oman      |