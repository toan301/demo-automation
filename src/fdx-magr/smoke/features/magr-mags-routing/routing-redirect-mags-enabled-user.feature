@redirect @routing @L6Tests @login
Feature: Validate redirects of for locales to Legacy Shipping page for User Accounts MAGR > MAGS

 Scenario Outline: Validate MAGS enabled locale + MAGS eligible customer are directed to legacy tool
    Given I browse to MAGR application
    Given As a "MAGICJAPAN" user I login locally using one of the tests env
    And I clear all cookies
    And I set the cookie "<locale>"
    And I refresh page
    When I ship from the "Manchester, UK" address in "United Kingdom"
    And I ship to the "Sydney Australia" address in "Australia"
    And I am shipping one "Your Packaging" weighing 10 "KG"
    And I request rates
    And I click on Ship button
    Then I am redirected to "<application>" 
    And the locale is set to "<returnLocale>" 
  Examples:
    |locale|application    |returnLocale|
    |en_AL |lite-ship.html?|en-al       |
    |en_AM |lite-ship.html?|en-am       |
    |en_AU |lite-ship.html?|en-au       |
    |en_AZ |lite-ship.html?|en-az       |
    |en_BH |lite-ship.html?|en-bh       |
    |en_BD |lite-ship.html?|en-bd       |
    |en_BY |lite-ship.html?|en-by       |
    |en_BE |lite-ship.html?|en-be       |
    |fr_BE |lite-ship.html?|fr-be       |
    |nl_BE |lite-ship.html?|nl-be       |
    |en_BA |lite-ship.html?|en-ba       |
    |en_BN |lite-ship.html?|en-bn       |
    |en_BG |lite-ship.html?|en-bg       |
    |bg_BG |lite-ship.html?|bg-bg       |
    |en_KH |lite-ship.html?|en-kh       |
    |en_HR |lite-ship.html?|en-hr       |
    |en_CY |lite-ship.html?|en-cy       |
    |cs_CZ |lite-ship.html?|cs-cz       |
    |en_CZ |lite-ship.html?|en-cz       |
    |en_EG |lite-ship.html?|en-eg       |
    |en_ET |lite-ship.html?|en-et       |
    |en_GE |lite-ship.html?|en-ge       |
    |en_GH |lite-ship.html?|en-gh       |
    |en_GI |lite-ship.html?|en-gi       |
    |en_GU |lite-ship.html?|en-gu       |
    |zh_HK |lite-ship.html?|zh-hk       |
    |en_HK |lite-ship.html?|en-hk       |
    |en_IS |lite-ship.html?|en-is       |
    |en_IN |lite-ship.html?|en-in       |
    |en_CI |lite-ship.html?|en-ci       |
    |ja_JP |lite-ship.html?|ja-jp       |
    |en_JP |lite-ship.html?|en-jp       |
    |en_JO |lite-ship.html?|en-jo       |
    |ko_KR |lite-ship.html?|ko-kr       |
    |en_KR |lite-ship.html?|en-kr       |
    |en_KW |lite-ship.html?|en-kw       |
    |en_LB |lite-ship.html?|en-lb       |
    |en_LU |lite-ship.html?|en-lu       |
    |en_MO |lite-ship.html?|en-mo       |
    |en_MK |lite-ship.html?|en-mk       |
    |en_MY |lite-ship.html?|en-my       |
    |en_MT |lite-ship.html?|en-mt       |
    |en_MU |lite-ship.html?|en-mu       |
    |en_MD |lite-ship.html?|en-md       |
    |en_ME |lite-ship.html?|en-me       |
    |en_MA |lite-ship.html?|en-ma       |
    |en_NP |lite-ship.html?|en-np       |
    |nl_NL |lite-ship.html?|nl-nl       |
    |en_NL |lite-ship.html?|en-nl       |
    |en_NZ |lite-ship.html?|en-nz       |
    |en_NG |lite-ship.html?|en-ng       |
    |en_PK |lite-ship.html?|en-pk       |
    |en_PH |lite-ship.html?|en-ph       |
    |pl_PL |lite-ship.html?|pl-pl       |
    |en_PL |lite-ship.html?|en-pl       |
    |en_QA |lite-ship.html?|en-qa       |
    |en_RO |lite-ship.html?|en-ro       |
    |ro_RO |lite-ship.html?|ro-ro       |
    |en_SA |lite-ship.html?|en-sa       |
    |en_RS |lite-ship.html?|en-rs       |
    |en_SG |lite-ship.html?|en-sg       |
    |en_LK |lite-ship.html?|en-lk       |
    |th_TH |lite-ship.html?|th-th       |
    |en_TH |lite-ship.html?|en-th       |
    |en_AE |lite-ship.html?|en-ae       |
    |en_UA |lite-ship.html?|en-ua       |
    |ua_UA |lite-ship.html?|ua-ua       |
    |vi_VN |lite-ship.html?|vi-vn       |
    |en_VN |lite-ship.html?|en-vn       |
    |en_ZW |lite-ship.html?|en-zw       |

