@liability-option
Feature: Liability Option

  Scenario: Liability Option check with en-us cookies
    Given I browse to MAGR application
    And I clear all cookies
    And I set the cookie "en_US"
    And I refresh page
    When I ship from the "Manchester, UK" address in "United Kingdom"
    And I ship to the "Sydney Australia" address in "Australia"
    And I click Liability Info button
    Then I should see message "If you choose to declare a value for carriage and pay the applicable surcharge, our maximum liability for this shipment in the case of, for example, loss, damage or delay, will equal the amount that you declared, subject to our Conditions of Carriage. If you choose not to declare a value here, our maximum liability for this shipment remains as set out in the applicable terms and conditions in the FedEx Service Guide"
    And Fedex Service Guide link should be visible
    
  Scenario: Liability Option check with other cookies
    Given I browse to MAGR application
    And I clear all cookies
    And I set the cookie "en_AR"
    And I refresh page
    When I ship from the "Manchester, UK" address in "United Kingdom"
    And I ship to the "Sydney Australia" address in "Australia"
    And I click Liability Info button
    Then I should see message "If you choose to declare a value for carriage and pay the applicable surcharge, our maximum liability for this shipment in the case of, for example, loss, damage or delay, will equal the amount that you declared, subject to our Conditions of Carriage. If you choose not to declare a value here, our maximum liability for this shipment remains as set out in our Conditions of Carriage."
    