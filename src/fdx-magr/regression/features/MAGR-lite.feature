@Tacocat @mock @failure
Feature: Verify necessary fields in MAGR-lite application
  In order to ship a shipment
  As a user I want to


  Background: MAGR-lite application
    Given I go to MAGR-lite app

  Scenario Outline: Verify only necessary fields are shown in MAGR-lite application as a logged in user from <fromAddress> to <toAddress>
    Given As a "MAGICJP" user I login locally into MAGR-lite
    And I change my locale cookie to "<locale>"
    Then I should not see the app bar
    And I <expect> the LTL freight link equalling <translation>
    And I should not see sender and recipient name fields
    When I ship from the "<fromAddress>" address in "<fromCountry>"
    When I ship to the "<toAddress>" address in "<toCountry>"
    And I should not see number of packages dropdown
    And I should not see shipping dimensions textbox, dimension unit and description
    And I should not see package customs value
    And I should not see the ship date field
    When I am shipping one "YOUR_PACKAGING" weighing 9 "KG"
    And I request rates
    Then I should not see view signature options along with i want shipment picked up checkbox
    Examples:
      | locale | fromAddress        | fromCountry    | toAddress           | toCountry     | expect         | translation           |
      | es_MX  | 560078, India      | India          | m1m1m1 canada      | Canada        | see            | ¿Envío de carga LTL?  |
      | en_CA  | Liverpool UK       | United Kingdom | TX 75043           | United States | see            | Shipping LTL Freight? |
      | en_US  | bejing china       | China          | 560078, India      | India         | see            | Shipping LTL Freight? |
      | en_JP  | Memphis , TN 38106 | United States  | Dresden , TN 38225 | United States | should not see | Shipping LTL Freight? |

#  Scenario Outline: Verify only necessary fields are shown in MAGR-lite application as a not logged in user
#    Given I go to MAGR app
#    And I change my locale to "<locale>"
#    Then I should not see the app bar
#    And I "<expect>" the LTL freight link
#    And I should not see sender and recipient name fields
#    When I ship to the "<toAddress>" address in "<toCountry>"
#    When I ship from the "<fromAddress>" address in "<fromCountry>"
#    And I should not see number of packages dropdown
#    And I should not see shipping dimensions textbox, dimension unit and description
#    And I should not see package customs value
#    And I should not see the ship date field
#    When I am shipping one "Your Packaging" weighing 9 "KG"
#    And I request rates
#    Then I should not see view signature options along with i want shipment picked up checkbox
#    Examples:
#      | locale | fromAddress        | fromCountry   | toAddress          | toCountry     | expect         |
#      | en_CA  | 560078, India       | India         | 560078, India       | India         | see            |
#      | en_US  | 560078, India       | India         | 560078, India       | India         | see            |
#      | es_MX  | Dresden , TN 38225 | United States | Memphis , TN 38106 | United States | see            |
#      | en_JP  | Memphis , TN 38106 | United States | Memphis , TN 38106 | United States | should not see |
