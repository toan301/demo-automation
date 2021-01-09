@Tacocat @mocking
Feature: verify rate quote section
  In order to ship a shipment
  As a user I want to


  Background: MAGR application
    Given I browse to MAGR application

# google address selection for getting rates for all the mandatory fields with logged in
  Scenario Outline: verify rates for <users> with origin "<fromCountry>" and destination "<toCountry>" in google address flow - all fields
    Given As a "<users>" user I login using cookie from test env
    When I ship from the "<fromAddress>" address in "<fromCountry>"
    When I ship to the "<toAddress>" address in "<toCountry>"
    Then I see default selected package type should be "Your Packaging"
    When I purchase a higher limit of liability
    When I am shipping one "<packageType>" weighing 9 "KG"
    And the carriage value is 10 "INR"
    And I choose ship date from list row 2
    And I request rates
    And I see selected ship date matches date in ship summary
    Then The rate list is displayed
    Examples:
      | users          | fromAddress                                       | fromCountry    | toAddress                                        | toCountry      | packageType           |
      | MAGICJAPAN        | 560078, India                                     | India          | Ernakulam, 682017                                | India          | YOUR_PACKAGING        |
      | Magsadmin      | The Mall Road, Delhi, 110054                      | India          | Kashmir, 177006                                  | India          | YOUR_PACKAGING        |
      | MAGICJAPAN        | Avon Park, 33825,                                 | United States  | Whitehouse, 75791,                               | United States  | FEDEX_EXTRA_LARGE_BOX |
      | Magsadmin      | 573 Av fort Brazil                                | Brazil         | 772 Rua Albuquerque Lins Brazil                  | Brazil         | YOUR_PACKAGING        |
      | MAGICJAPAN        | Memphis , TN 38106                                | United States  | m1m1m1 canada                                    | Canada         | FEDEX_SMALL_BOX       |
      | MAGICJAPAN   | 17 Bulevardul Schitu Măgureanu, București, 030167 | Romania        | 999 Canada Place, Vancouver, V6C3T4,             | Canada         | FEDEX_25KG_BOX        |
      | Magsadmin      | 1644 Collins Avenue, Miami Beach, 33139,          | United States  | Ciudad de México                                 | Mexico         | FEDEX_LARGE_BOX       |
      | MAGICJAPAN        | 11 Centre Street, New York, 10007                 | United States  | central hong kong                                | Hong kong      | FEDEX_TUBE            |
      | Magsadmin      | bejing china                                      | China          | 95 Queensway,                                    | Hong kong      | FEDEX_25KG_BOX        |
      | MAGICJAPAN   | Chuo City, 103-0028                               | Japan          | 1502 Marilla Street, Dallas, 75201,              | United States  | YOUR_PACKAGING        |
      | UKDomesticUser | Liverpool UK                                      | United Kingdom | A4, Greater London, WC2N5DU                      | United Kingdom | FEDEX_PAK             |
      | UKDomesticUser | 30 Raffles Avenue, Singapore                      | Singapore      | Unnamed Road NORWAY ,                            | Norway         | FEDEX_PAK             |
      | UKDomesticUser | Istanbul Turkey                                   | Turkey         | Bang Na-Trat Road, Krung Thep Maha Nakhon, 10540 | Thailand       | FEDEX_PAK             |

    # google address selection for getting rates for all the mandatory fields with non -logged in
  Scenario Outline: verify rates for anonymous user with origin "<fromCountry>" and destination "<toCountry>" in google address flow - all fields
    Given I ship from the "<fromAddress>" address in "<fromCountry>"
    When I ship to the "<toAddress>" address in "<toCountry>"
    Then I see default selected package type should be "Your Packaging"
    When I purchase a higher limit of liability
    And I am shipping one "<packageType>" weighing 9 "KG"
    Then the carriage value is 22 "INR"
    And I choose ship date from list row 2
    When I request rates
    And I see selected ship date matches date in ship summary
    Then The rate list is displayed
    Examples:
      | fromAddress                                            | fromCountry    | toAddress                                       | toCountry     | packageType           |
      | Hariyana, 246761,                                      | India          | Mysuru, 570004,                                 | India         | YOUR_PACKAGING        |
      # | 114 William Hilton Parkway, Hilton Head Island, 29926, | United States  | 4701 Great America Parkway, Santa Clara, 95054, | United States | FEDEX_EXTRA_LARGE_BOX | // System Error message appeared
      | 1100 Congress Avenue, Austin, 78701,                   | United States  | 1 Canada's Wonderland Drive, Vaughan, L6A1S6,   | Canada        | FEDEX_25KG_BOX        |
      | 16900 Harvard Avenue, Irvine, 92614,                   | United States  | Ciudad de México                                | Mexico        | FEDEX_LARGE_BOX       |
      | New York, 10004,                                       | United States  | central hong kong                               | Hong Kong     | FEDEX_TUBE            |
      | bejing china                                           | China          | Eastern Street,                                 | Hong Kong     | FEDEX_25KG_BOX        |
      | Chuo City, 103-0028                                    | Japan          | Manhattan Beach, 90266,                         | United States | YOUR_PACKAGING        |
      | lIVERPOOL UK                                           | United Kingdom | Belén, 40703 costa                              | Costa Rica    | YOUR_PACKAGING        |
      | 2C Bengt Ekehjelmsgatan, 11854,                        | Sweden         | Central Road, Harare,                           | Zimbabwe      | YOUR_PACKAGING        |
      | Ghan, 0872,                                            | Australia      | New Zealand State Highway 43, Stratford,        | New Zealand   | YOUR_PACKAGING        |


# # google address selection for getting rates for optional fields with logged in
  Scenario Outline: verify rates for <users> with origin "<fromCountry>" and destination "<toCountry>" in google address flow - optional
    Given As a "<users>" user I login using cookie from test env
    When I ship to the "<toAddress>" address in "<toCountry>"
    When I ship from the "<fromAddress>" address in "<fromCountry>"
    Then I see default selected package type should be "Your Packaging"
    And I am shipping one "<packageType>" weighing 9 "KG"
    And I choose ship date from list row 2
    When I request rates
    And I see selected ship date matches date in ship summary
    Then The rate list is displayed
    Examples:
      | users     | fromAddress                  | fromCountry   | toAddress                        | toCountry     | packageType           |
      | MAGICJAPAN   | 560078, India                | India         | Banerji Road, Ernakulam, 682017, | India         | YOUR_PACKAGING        |
      | Magsadmin | The Mall Road, Delhi, 110054 | India         | Kashmir, 177006                  | India         | YOUR_PACKAGING        |
      | MAGICJAPAN   | Avon Park, 33825,            | United States | Whitehouse, 75791,               | United States | FEDEX_EXTRA_LARGE_BOX |
      | MAGICJAPAN   | Memphis , TN 38106           | United States | m1m1m1 canada                    | Canada        | FEDEX_SMALL_BOX       |


#     # google address selection for getting rates for optional fields with non -logged in
  Scenario Outline: verify rates for anonymous user with origin "<fromCountry>" and destination "<toCountry>" in google address flow - optional
    Given I ship from the "<fromAddress>" address in "<fromCountry>"
    When I ship to the "<toAddress>" address in "<toCountry>"
    Then I see default selected package type should be "Your Packaging"
    And I am shipping one "<packageType>" weighing 9 "KG"
    And I choose ship date from list row 2
    When I request rates
    And I see selected ship date matches date in ship summary
    Then The rate list is displayed
    Examples:
      | fromAddress                                            | fromCountry   | toAddress                                       | toCountry     | packageType           |
      | Hariyana, 246761,                                      | India         | Mysuru, 570004,                                 | India         | YOUR_PACKAGING        |
      | 114 William Hilton Parkway, Hilton Head Island, 29926, | United States | 4701 Great America Parkway, Santa Clara, 95054, | United States | FEDEX_EXTRA_LARGE_BOX |
      | 1100 Congress Avenue, Austin, 78701,                   | United States | 1 Canada's Wonderland Drive, Vaughan, L6A1S6,   | Canada        | FEDEX_25KG_BOX        |
      | 16900 Harvard Avenue, Irvine, 92614,                   | United States | Ciudad de México                                | Mexico        | FEDEX_LARGE_BOX       |
      | New York, 10004,                                       | United States | central hong kong                               | Hong Kong     | FEDEX_TUBE            |
      | bejing china                                           | China         | Eastern Street,                                 | Hong Kong     | FEDEX_10KG_BOX        |


#    # Manual Entry address selection for getting rates for all the mandatory fields with logged in
  @bug @fail
  Scenario Outline: verify rates for <users> with origin "<fromCountry>" and destination "<toCountry>" in Manual flow - all fields
    Given As a "<users>" user I login using cookie from test env
    When I enter "@#$%" in "From" field and proceed to manual entry
    When I enter "@#$%" in "To" field and proceed to manual entry
    And I select "<fromCountry>" as "origin" from list of countries
    And I enter "ORIGIN" code "<fromPostal>" as "origin"
    And I select "<toCountry>" as "To" from list of countries
    And I enter "DESTINATION" code "<toPostal>" as "To"
    And I continue to ship using manual address search
    When I purchase a higher limit of liability
    And I see default selected package type should be "Your Packaging"
    And I am shipping one "<packageType>" weighing 8 "KG"
    And the carriage value is 22 "USD"
    And I choose ship date from list row 2
    When I request rates
    And I see selected ship date matches date in ship summary
    Then The rate list is displayed
    Examples:
      | users          | fromPostal | fromCountry    | toPostal | toCountry      | packageType           |
      | Magsadmin      | 560078     | India          | 110054   | India          | YOUR_PACKAGING        |
      | MAGICJAPAN        | 38225     | United States  | M1M1M1   | Canada         | FEDEX_EXTRA_LARGE_BOX |
      | MAGICJAPAN   | 90001      | United States  | 10005    | United States  | FEDEX_MEDIUM_BOX      |
      | UKDomesticUser | L10AJ      | United Kingdom | E17AA    | United Kingdom | FEDEX_PAK             |

  Scenario Outline: verify rates for for anonymous user with origin "<fromCountry>" and destination "<toCountry>" in Manual flow - all fields
    When I enter "@#$%" in "From" field and proceed to manual entry
    When I enter "@#$%" in "To" field and proceed to manual entry
    And I select "<fromCountry>" as "origin" from list of countries
    And I enter "ORIGIN" code "<fromPostal>" as "origin"
    And I select "<toCountry>" as "To" from list of countries
    And I enter "DESTINATION" code "<toPostal>" as "To"
    And I continue to ship using manual address search
    And I purchase a higher limit of liability
    Then I see default selected package type should be "Your Packaging"
    And I want to ship 4 packages
    When I am shipping one "<packageType>" weighing 8 "KG"
    Then I should see total package is "4"
    And I should see total weight is "32 KG"
    Then the carriage value is 10 "USD"
    And I choose ship date from list row 2
    When I request rates
    And I see selected ship date matches date in ship summary
    Then The rate list is displayed
    Examples:
      | fromPostal | fromCountry | toPostal | toCountry     | packageType    |
      | L6A1S6     | Canada      | 110054   | India         | YOUR_PACKAGING |
      # | 1121       | Luxembourg  | 2618     | Australia     | FEDEX_25KG_BOX | // for this address, only 1 package is allowed
      # | 00160      | Finland     | 2132LR   | Netherlands   | FEDEX_10KG_BOX | // for this address, only 1 package is allowed
      # | 636000     | China       | 90002    | United States | YOUR_PACKAGING | // for this address, only 1 package is allowed


#      # Manual Entry address selection for getting rates for all the mandatory fields with logged in
  Scenario Outline: verify rates for <users> with origin "<fromCountry>" and destination "<toCountry>" in Manual flow - optional
    Given As a "<users>" user I login using cookie from test env
    When I enter "@#$%" in "From" field and proceed to manual entry
    When I enter "@#$%" in "To" field and proceed to manual entry
    And I select "<fromCountry>" as "origin" from list of countries
    And I enter "ORIGIN" code "<fromPostal>" as "origin"
    And I select "<toCountry>" as "To" from list of countries
    And I enter "DESTINATION" code "<toPostal>" as "To"
    And I continue to ship using manual address search
    Then I see default selected package type should be "Your Packaging"
    When I am shipping one "<packageType>" weighing 8 "KG"
    And I want to ship 2 packages
    Then I should see total package is "2"
    And I should see total weight is "16 KG"
    And I choose ship date from list row 2
    When I request rates
    And I see selected ship date matches date in ship summary
    Then The rate list is displayed
    Examples:
      | users     | fromPostal | fromCountry   | toPostal | toCountry | packageType    |
      | Magsadmin | 560078     | India         | 10115    | Germany   | YOUR_PACKAGING |
      | MAGICJAPAN   | Dresden , TN 38225 | United States | M1M1M1   | Canada    | FEDEX_10KG_BOX |

  Scenario Outline: verify rates for for anonymous user with origin "<fromCountry>" and destination "<toCountry>" in Manual flow - optional
    When I enter "@#$%" in "From" field and proceed to manual entry
    When I enter "@#$%" in "To" field and proceed to manual entry
    And I select "<fromCountry>" as "origin" from list of countries
    And I enter "ORIGIN" code "<fromPostal>" as "origin"
    And I select "<toCountry>" as "To" from list of countries
    And I enter "DESTINATION" code "<toPostal>" as "To"
    And I continue to ship using manual address search
    Then I see default selected package type should be "Your Packaging"
    And I am shipping one "<packageType>" weighing 8 "KG"
    And I choose ship date from list row 2
    When I request rates
    And I see selected ship date matches date in ship summary
    Then The rate list is displayed
    Examples:
      | fromPostal | fromCountry    | toPostal | toCountry | packageType    |
      | 38003      | Canary Islands | 110054   | India     | YOUR_PACKAGING |
      | 560401     | Singapore      | 17130    | Thailand  | FEDEX_25KG_BOX |

  Scenario: verify one rate and retail rate flow for US domestic with anonymous user along with pickup
    When I ship from the "Dresden , TN 38225s" address in "United States"
    Given I enter "@#$%" in "To" field and proceed to manual entry
    And I select "United States" as "To" from list of countries
    Then I enter "DESTINATION" code "48202" as "To"
    And I continue to ship using manual address search
    Then I see default selected package type should be "Your Packaging"
    When I purchase a higher limit of liability
    And I am shipping one "FEDEX_ENVELOPE" weighing 5 "LB"
    Then I should see weight label contains recommended
    When the carriage value is 30 "USD"
    When I request rates
    Then I should see retail rate and one rate links for anonymous user
    And FedEx One rates are shown
    Then The 1 st offer price breakdown has price components in "$"
      | 0 | Base rate |
      | 1 | Estimated Total |
    When I choose to have the shipment picked up
    Then I should see item under the 1 st offer price breakdown
      | 1 | FedEx pickup   |
    When I request FedEx Retail rates
    Then I get a tip the weight limit is exceeded
    When I am shipping one "FEDEX_ENVELOPE" weighing 1 "LB"
    And I request rates
    Then FedEx Retail rates are shown
    Then The 1 st offer price breakdown has price components in "$"
      | 0 | Base rate |
      | 1 | Fuel Surcharge  |
      | 2 | Estimated Total |

  Scenario: verify one rate and account specific rate flow for US domestic with LoggedIn user along with pickup
    Given As a "MAGICJAPAN" user I login using cookie from test env
    Given I enter "@#$%" in "To" field and proceed to manual entry
    And I select "United States" as "To" from list of countries
    Then I enter "DESTINATION" code "75234" as "To"
    And I continue to ship using manual address search
    Then I see default selected package type should be "Your Packaging"
    When I purchase a higher limit of liability
    And I am shipping one "FEDEX_25KG_BOX" weighing 10 "LB"
    Then I should see weight label contains recommended
    When the carriage value is 21 "USD"
    When I request rates
    Then The 1 st offer price breakdown has price components in "¥"
      | 0 | Base rate |
      | 1 | Fuel Surcharge  |
      | 2 | Estimated Total |
    And I see standard rate link is renamed as Account-Specific for loggedIn user
    Then I request rates
    Then The rate list is displayed
