@redirect @routing @login @L6Tests
Feature: Validate redirects for locales to NEW Shipping page MAGR > MAGS

Scenario Outline: Validate redirect for locales to NEW Shipping page - SINGLE PACKAGE
  Given I browse to MAGR application
  And I clear all cookies
  And I set the cookie "<locale>"
  And I refresh page
  When I ship from the "Manchester, UK" address in "United Kingdom"
  And I ship to the "Sydney Australia" address in "Australia"
  And I am shipping one "Your Packaging" weighing 10 "KG"
  And I request rates
  And I click on Ship button
  Then I am redirected to "<applicationUrl>" 
  And the locale is set to "<returnLocale>"
  And I assert page title is not 404
 Examples:
  | locale      | returnLocale    | applicationUrl    |
  | en_BF       | en-bf           | shipping.html|
  | en_BJ       | en-bj           | shipping.html|
  | en_BT       | en-bt           | shipping.html|
  | en_CD       | en-cd           | shipping.html|
  | en_CG       | en-cg           | shipping.html|
  | en_CM       | en-cm           | shipping.html|
  | en_CV       | en-cv           | shipping.html|
  | en_ER       | en-er           | shipping.html|
  | en_GL       | en-fo           | shipping.html|
  | en_GA       | en-ga           | shipping.html|
  | en_GM       | en-gm           | shipping.html|
  | en_GN       | en-gn           | shipping.html|
  | en_KG       | en-kg           | shipping.html|
  | en_LR       | en-lr           | shipping.html|
  | en_ML       | en-ml           | shipping.html|
  | en_MR       | en-mr           | shipping.html|
  | en_NE       | en-ne           | shipping.html|
  | en_RE       | en-re           | shipping.html|
  | en_SC       | en-sc           | shipping.html|
  | en_SN       | en-sn           | shipping.html|
  | en_TD       | en-td           | shipping.html|
  | en_UZ       | en-uz           | shipping.html|



Scenario Outline: Validate redirect for locales to New Shipping page - MULTI PACKAGE
Given I browse to MAGR application
And I clear all cookies
And I set the cookie "<locale>"
And I refresh page
When I ship from the "Manchester, UK" address in "United Kingdom"
And I ship to the "Sydney Australia" address in "Australia"
And I want to ship 2 packages
And the packages are identical
And I am shipping one "Your Packaging" weighing 10 "KG"
And I request rates
And I click on Ship button
Then I am redirected to "<applicationUrl>" 
And the locale is set to "<returnLocale>"
And I assert page title is not 404
  Examples:
  | locale      | returnLocale    | applicationUrl|
  | en_BF       | en-bf           | shipping.html|
  | en_BJ       | en-bj           | shipping.html|
  | en_BT       | en-bt           | shipping.html|
  | en_CD       | en-cd           | shipping.html|
  | en_CG       | en-cg           | shipping.html|
  | en_CM       | en-cm           | shipping.html|
  | en_CV       | en-cv           | shipping.html|
  | en_ER       | en-er           | shipping.html|
  | en_GL       | en-gl           | shipping.html|
  | en_GA       | en-ga           | shipping.html|
  | en_GM       | en-gm           | shipping.html|
  | en_GN       | en-gn           | shipping.html|
  | en_KG       | en-kg           | shipping.html|
  | en_LR       | en-lr           | shipping.html|
  | en_ML       | en-ml           | shipping.html|
  | en_MR       | en-mr           | shipping.html|
  | en_NE       | en-ne           | shipping.html|
  | en_RE       | en-re           | shipping.html|
  | en_SC       | en-sc           | shipping.html|
  | en_SN       | en-sn           | shipping.html|
  | en_TD       | en-td           | shipping.html|
  | en_UZ       | en-uz           | shipping.html|

 
