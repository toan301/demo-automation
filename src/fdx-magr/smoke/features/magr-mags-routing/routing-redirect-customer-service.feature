@redirect @routing @L6Tests
Feature: Validate redirects of for locales to Customer Service MAGR > MAGS

Scenario Outline: Validate redirect for locales to Customer Support page - SINGLE PACKAGE
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
  |locale|returnLocale|applicationUrl|
  |en_BF|en-bf|customer-support.html|
  |en_BJ|en-bj|customer-support.html|
  |en_BT|en-bt|customer-support.html|
  |en_CD|en-cd|customer-support.html|
  |en_CG|en-cg|customer-support.html|
  |en_CK|en-ck|customer-support.html|
  |en_CM|en-cm|customer-support.html|
  |en_CV|en-cv|customer-support.html|
  |en_ER|en-er|customer-support.html|
  |en_FJ|en-fj|customer-support.html|
  |en_FM|en-fm|customer-support.html|
  |en_FO|en-fo|customer-support.html|
  |en_GL|en-gl|customer-support.html|
  |en_GA|en-ga|customer-support.html|
  |en_GM|en-gm|customer-support.html|
  |en_GN|en-gn|customer-support.html|
  |en_KG|en-kg|customer-support.html|
  |en_LR|en-lr|customer-support.html|
  |en_MH|en-mh|customer-support.html|
  |en_ML|en-ml|customer-support.html|
  |en_MN|en-mn|customer-support.html|
  |en_MP|en-mp|customer-support.html|
  |en_MR|en-mr|customer-support.html|
  |en_NC|en-nc|customer-support.html|
  |en_NE|en-ne|customer-support.html|
  |en_PF|en-pf|customer-support.html|
  |en_PG|en-pg|customer-support.html|
  |en_PW|en-pw|customer-support.html|
  |en_RE|en-re|customer-support.html|
  |en_SC|en-sc|customer-support.html|
  |en_SN|en-sn|customer-support.html|
  |en_TD|en-td|customer-support.html|
  |en_UZ|en-uz|customer-support.html|
  |en_VU|en-vu|customer-support.html|
  |en_WF|en-wf|customer-support.html|


  Scenario Outline: Validate redirect for locales to Customer Support page - MULTI PACKAGE
  Given I browse to MAGR application
  And I clear all cookies
  And I set the cookie "<locale>"
  And I refresh page
  When I ship from the "Manchester, UK" address in "United Kingdom"
  And I ship to the "Sydney Australia" address in "Australia"
  And I want to ship 2 packages
  And I am shipping one "Your Packaging" weighing 10 "KG"
  And the packages are identical
  And I request rates
  And I click on Ship button
  Then I am redirected to "<applicationUrl>" 
  And the locale is set to "<returnLocale>"
  And I assert page title is not 404
  Examples:
  |locale|returnLocale|applicationUrl|
  |en_BF|en-bf|customer-support.html|
  |en_BJ|en-bj|customer-support.html|
  |en_BT|en-bt|customer-support.html|
  |en_CD|en-cd|customer-support.html|
  |en_CG|en-cg|customer-support.html|
  |en_CK|en-ck|customer-support.html|
  |en_CM|en-cm|customer-support.html|
  |en_CV|en-cv|customer-support.html|
  |en_ER|en-er|customer-support.html|
  |en_FJ|en-fj|customer-support.html|
  |en_FM|en-fm|customer-support.html|
  |en_FO|en-fo|customer-support.html|
  |en_GL|en-gl|customer-support.html|
  |en_GA|en-ga|customer-support.html|
  |en_GM|en-gm|customer-support.html|
  |en_GN|en-gn|customer-support.html|
  |en_KG|en-kg|customer-support.html|
  |en_LR|en-lr|customer-support.html|
  |en_MH|en-mh|customer-support.html|
  |en_ML|en-ml|customer-support.html|
  |en_MN|en-mn|customer-support.html|
  |en_MP|en-mp|customer-support.html|
  |en_MR|en-mr|customer-support.html|
  |en_NC|en-nc|customer-support.html|
  |en_NE|en-ne|customer-support.html|
  |en_PF|en-pf|customer-support.html|
  |en_PG|en-pg|customer-support.html|
  |en_PW|en-pw|customer-support.html|
  |en_RE|en-re|customer-support.html|
  |en_SC|en-sc|customer-support.html|
  |en_SN|en-sn|customer-support.html|
  |en_TD|en-td|customer-support.html|
  |en_UZ|en-uz|customer-support.html|
  |en_VU|en-vu|customer-support.html|
  |en_WF|en-wf|customer-support.html|

