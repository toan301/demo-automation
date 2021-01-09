@Tacocat

#@magr-558588
Feature: verify ship date and shipment details
  In order to ship a shipment
  As a user I want to

  Background: MAGR application
    Given I go to MAGR app

#    This scenario covers
  Scenario: verify shipment details for dimensions fields for your packaging and no-dimensions for FedEx packaging
    Given I ship from the "560078" address in "India"
    And I ship to the "Memphis , TN 38106" address in "United States"
    Then I see Dimension L x W x H along with dimension unit when package type is your packaging
    And I request rates and i should see weight required error in package section
    And I am shipping one "FEDEX_BOX" weighing 11 "KG"
    Then I should not see Dimension L x W x H along with dimension unit when package type is otherthan your packaging
    Then I am shipping with customs value as "12"
    And I choose ship date from list row 1
    When I request rates
    And I see selected ship date matches date in ship summary
    And I choose ship date from list row 2
    When I request rates
    And I see selected ship date matches date in ship summary
    Then rates and delivery information is shown to the "anonymous" user

  @needsmocking
  Scenario: verify shipment summary for Logged-in user for multiple carriage package
    Given As a "Magsadmin" user I login locally into MAGR
    And I ship to the "m1m1m1" address in "Canada"
    Then I see default selected package type should be Your Packaging
    And I want to ship 3 packages
    When Those packages are not identical
    Then I should be referred to advanced shipping
    And I select Yes to proceed with identical flow
    Then I should see instruction message as carriage value per package
    And I am shipping one "YOUR_PACKAGING" weighing 10 "KG"
    Then I see Dimension L x W x H along with dimension unit when package type is your packaging
    And I am shipping one "FEDEX_SMALL_BOX" weighing 9 "LB"
    Then I should not see Dimension L x W x H along with dimension unit when package type is otherthan your packaging
    Then I am shipping with customs value as "12"
    When I request rates
    Then rates and delivery information is shown to the "Loggedin" user
    And  I select No to proceed with identical flow
    And I ship to the "Memphis , TN 38106" address in "United States"
    Then I see default selected package type should be FedEx Small Box
    And I want to ship 3 packages
    When Those packages are not identical
    Then I should be referred to advanced shipping
    And I select Yes to proceed with identical flow
    Then I should see instruction message as declared value per package
    And I am shipping one "YOUR_PACKAGING" weighing 10 "LB"
    Then I see Dimension L x W x H along with dimension unit when package type is your packaging
    When I request rates
    Then rates and delivery information is shown to the "Loggedin" user

  @needsmocking
  Scenario: verify shipment summary for Logged-in user for Freight services with dimension
    Given As a "MAGICJP" user I login locally into MAGR
    And I ship to the "Memphis , TN 38106" address in "United States"
    Then I see default selected package type should be Your Packaging
    And I am shipping one "YOUR_PACKAGING" weighing 100 "LB"
    And I am shipping Dimensions L x W x H as "68" x "68" x "68" unit "IN"
    And I select package contents as "items"
    Then I select i am shipping to a residence checkbox
    When I request rates
    Then rates and delivery information is shown to the "Loggedin" user
    Then I should see residential delivery surcharge under rate breakdown
    And I should see rate quotes with fedex services as Freight

  @needsmocking
  Scenario: verify shipment summary for Logged-in user for Freight services with weight greater then 150 lb
    Given As a "MultiAccount" user I login locally into MAGR
    And I ship to the "Pinehouse" address in "Canada"
    Then I see default selected package type should be Your Packaging
    And I am shipping one "YOUR_PACKAGING" weighing 151 "LB"
    And I select package contents as "items"
    Then I select i am shipping to a residence checkbox
    When I request rates
    Then rates and delivery information is shown to the "Loggedin" user
    Then I should see residential delivery surcharge under rate breakdown
    And I should see rate quotes with fedex services as Freight

  @needsmocking
  Scenario: verify shipment summary for Logged-in user for multiple carriage package switch back to single piece
    Given As a "Magsadmin" user I login locally into MAGR
    And I ship to the "m1m1m1" address in "Canada"
    Then I see default selected package type should be Your Packaging
    And I want to ship 3 packages
    When Those packages are not identical
    Then I should be referred to advanced shipping
    And I select Yes to proceed with identical flow
    Then I should see instruction message as carriage value per package
    And I am shipping one "YOUR_PACKAGING" weighing 10 "KG"
    Then I see Dimension L x W x H along with dimension unit when package type is your packaging
    And I am shipping one "FEDEX_SMALL_BOX" weighing 9 "LB"
    Then I should not see Dimension L x W x H along with dimension unit when package type is otherthan your packaging
    Then I am shipping with customs value as "40"
    When I request rates
    Then rates and delivery information is shown to the "Loggedin" user
    And  I select No to proceed with identical flow
    And I ship to the "Memphis , TN 38106" address in "United States"
    Then I see default selected package type should be FedEx Small Box
    And I want to ship 1 packages
    And I am shipping one "YOUR_PACKAGING" weighing 10 "LB"
    Then I see Dimension L x W x H along with dimension unit when package type is your packaging
    When I request rates
    Then rates and delivery information is shown to the "Loggedin" user

