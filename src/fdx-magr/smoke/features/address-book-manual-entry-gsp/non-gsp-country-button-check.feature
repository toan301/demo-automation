@gsp
Feature: Shipping from NON-GSP countries only - show correct button label
  As a user I want to be able to ship from GSP countries
  Where I am provided with GSP specific options

  Background: Open application
    Given I browse to MAGR application

  Scenario Outline: User shipping from NON-gsp country should see show rates button
    Given I ship from the "<city>" address in "<country>"
    And I ship to the "1181HZ" address in "Netherlands"
    And I am shipping one "Your Packaging" weighing 1 "KG"
    And I should see the "show rates" button
    Examples:
    |   city                          | country   | 
    | 	Westminster, London SW1A 0AA	| United Kingdom	    | 