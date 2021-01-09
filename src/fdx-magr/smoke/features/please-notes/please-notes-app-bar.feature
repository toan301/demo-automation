@magr-5558333 @note
Feature: Show different please notes
  As a user
  I want to check please notes

  Background: Open application
    Given I browse to MAGR application

  Scenario: for domestic shipment
    Given I ship from the "1181HZ" address in "Netherlands"
    And I ship to the "38224" address in "United States"
    And I want to ship with my own packaging
      |length | width | height | weight |
      |   11  |  11   |   11   |   22   |
    When I request rates
    Then I see please notes link and text shown as "View more details"
    # had to chnage login user from L6USRR to MAGICJP as it doesn't work anymore

  @login
  Scenario: for Logged-in user
    And As a "MAGICJAPAN" user I login using cookie from L6 env
    And I ship from the "newyork" address in "United States"
    And I ship to the "38224" address in "United States"
    And I want to ship with my own packaging
      |length | width | height | weight |
      |   11  |  11   |   11   |   22   |
    When I request rates
#    Then I see advance rating link TODO: investigate
    Then I see please notes link and text shown as "View more details"

  @login
  Scenario: check app-bar for logged-in user
    And As a "MAGICJAPAN" user I login using cookie from L6 env
    And I check app-bar is displayed
    Then I check sub-menu item "FedEx Rate Sheets" is displayed under "Rate Tools" menu-item
    # will be enable once we have multi account
    # And I ship from the "newyork" address in "United States"
    # And I ship to the "1181HZ" address in "Netherlands"
    # And I want to ship with my own packaging
    #   |length | width | height | weight |
    #   |   11  |  11   |   11   |   22   |
    # When I request rates
    # Then rate list is shown
    # And I select account "My Account-800" from app-bar
    # And rate list is shown

  @login
  Scenario Outline: Check username in application title for logged-in user
   When As a "<userName>" user I login using cookie from L6 env
   Then the heading of the rating tool contains "<fullName>"

   Examples: Users
    | userName    | fullName      |
    | MAGICJAPAN  | Shrikant      |
