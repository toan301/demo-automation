@e2e-locale-check
Feature: Verify correct integration of MAGR-lite into AEM application
  In order to ship a shipment
  As a user I want to

  Background: MAGR-lite application in AEM
    Given I open MAGR in AEM

#  Scenario: Check deviations for logged in user
#    When As a "MAGICJP" user I login into MAGR
#    And I click the rating cube
#    Then I should not see sender and recipient name fields
#    And I see from field default to "10 FedEx Parkway, Shijo Karasuma, KANUMA-SHI, 32200, JP"

  Scenario Outline: Check locale; <locale> from <fromCountry> to <toCountry>
    And I change my locale to "<locale>"
    And I click the rating cube
    Then I should not see the app bar
    And I <expect> the LTL freight link equalling <test>
    And I should not see sender and recipient name fields
    When I ship from the "<fromAddress>" address in "<fromCountry>"
    When I ship to the "<toAddress>" address in "<toCountry>"
    Then I should not see number of packages dropdown
    And I should not see shipping dimensions textbox, dimension unit and description
    And I should not see package customs value
    And I should not see the ship date field
    When I am shipping one "YOUR_PACKAGING" weighing 9 "KG"
    And I request rates
    Then I should not see view signature options along with i want shipment picked up checkbox
    Examples:
      | locale | fromAddress        | fromCountry   | toAddress          | toCountry      | expect         | test                                         |
      | es_US  | LIVERPOOL, UK      | UK            | Garland, TX 75043  | United States  | see            | ¿Envío de carga LTL?                         |
      | en_US  | 560078, India      | India         | 560078, India      | India          | see            | Shipping LTL Freight?                        |
      | en_CA  | 560078, India      | India         | 560078, India      | India          | see            | Shipping LTL Freight?                        |
      | fr_CA  | 234 Pine St. N     | Canada        | Garland, TX 75043  | United States  | see            | Vous expédiez du fret en chargement partiel? |
       # | es_MX | 06700 Puebla | Mexico | Memphis , TN 38106 | United States | see | ¿Envío de carga LTL? | # Currently not applicable
      | sk_SK  | 029 01 Namestovo   | Slovakia      | Garland, TX 75043  | United States  | should not see |                                              |
      | zh_CN  | Beijing 100052     | China         | Liverpool UK       | United Kingdom | should not see |                                              |
      | zh_TW  | Taipei             | Taiwan        | 560078, India      | India          | should not see |                                              |
      | ja_JP  | Tokyo              | Japan         | Garland, TX 75043  | United States  | should not see |                                              |
      | en_JP  | Memphis , TN 38106 | United States | Memphis , TN 38106 | United States  | should not see |                                              |
      | en_AL  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_AI  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_AG  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_AM  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_AW  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_AZ  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_BS  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_BB  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_BY  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_BZ  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_BM  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_BQ  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_BA  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_VG  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_BG  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_KY  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_CN  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_CW  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_CY  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_FO  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_GF  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_GE  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_GI  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_GL  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_GD  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_GU  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_GY  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_IS  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_JM  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_LA  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_MO  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_MK  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_MY  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_MD  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_ME  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_MS  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_NZ  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_RO  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_KN  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_LC  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_MF  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_VC  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_RS  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_SG  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_SX  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_SK  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_SR  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_TW  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_TH  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_TT  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_TC  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_VI  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_UA  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |
      | en_GB  | Liverpool UK       | UK            | Garland, TX 75043  | United States  | should not see |                                              |