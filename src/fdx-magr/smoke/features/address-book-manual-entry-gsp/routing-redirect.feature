@redirect @routing @L6Tests
Feature: Validate redirects of legacy and new applications MAGR > MAGS

  Scenario Outline: Validate redirect for locales to Customer Support page
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
  Examples:
  | locale      | returnLocale    | applicationUrl       |
  | en_AS       | en-us           | customer-support.html|
  | en_FO       | en-fo           | customer-support.html|
  | en_CK       | en-ck           | customer-support.html|
  | en_FJ       | en-fj           | customer-support.html|
  | en_FM       | en-fm           | customer-support.html|
  | en_MH       | en-mh           | customer-support.html|
  | en_MN       | en-mn           | customer-support.html|
  | en_MP       | en-mp           | customer-support.html|
  | en_NC       | en-nc           | customer-support.html|
  | en_PF       | en-pf           | customer-support.html|
  | en_PG       | en-pg           | customer-support.html|
  | en_PW       | en-pw           | customer-support.html|
  | en_VU       | en-vu           | customer-support.html|
  | en_WF       | en-wf           | customer-support.html|




  Scenario Outline: Validate redirect for locales to legacyShipping page
    Given I browse to MAGR application
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
  | locale      | returnLocale    | application  |
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


  Scenario Outline: Validate redirect for locales to new ShippingAction Page
    Given I browse to MAGR application
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
    And the origin and language is set to "<country>" and "<lang>"
  Examples:
  | locale      | returnLocale    | application        |country|lang|
  | ar_AE       | ar_ae           | shipEntryAction.do?|ae     |ar  |
  | cs_CZ       | cs-cz           | shipEntryAction.do?|cz     |cs  |
  | da_DK       | da-dk           | shipEntryAction.do?|dk     |da  |
  | de_AT       | de-at           | shipEntryAction.do?|at     |de  |
  | de_CH       | de-ch           | shipEntryAction.do?|ch     |de  |
  | de_DE       | de-de           | shipEntryAction.do?|de     |de  |
  | en_AE       | en-ae           | shipEntryAction.do?|ae     |en  |
  | en_AF       | en-af           | shipEntryAction.do?|af     |en  |
  | en_AL       | en-al           | shipEntryAction.do?|al     |en  |
  | en_AM       | en-am           | shipEntryAction.do?|am     |en  |
  | en_AO       | en-ao           | shipEntryAction.do?|ao     |en  |
  | en_AR       | en-ar           | shipEntryAction.do?|ar     |en  |
  | en_AT       | en-at           | shipEntryAction.do?|at     |en  |
  | en_AZ       | en-az           | shipEntryAction.do?|az     |en  |
  | en_BA       | en-ba           | shipEntryAction.do?|ba     |en  |
  | en_BB       | en-bb           | shipEntryAction.do?|bb     |en  |
  | en_BD       | en-bd           | shipEntryAction.do?|bd     |en  |
  | en_BE       | en-be           | shipEntryAction.do?|be     |en  |
  | en_BG       | en-bg           | shipEntryAction.do?|bg     |en  |
  | en_BH       | en-bh           | shipEntryAction.do?|bh     |en  |
  | en_BI       | en-bi           | shipEntryAction.do?|bi     |en  |
  | en_BM       | en-bm           | shipEntryAction.do?|bm     |en  |
  | en_BO       | en-bo           | shipEntryAction.do?|bo     |en  |
  | en_BQ       | en-bq           | shipEntryAction.do?|bq     |en  |
  | en_BR       | en-br           | shipEntryAction.do?|br     |en  |
  | en_BS       | en-bs           | shipEntryAction.do?|bs     |en  |
  | en_BW       | en-bw           | shipEntryAction.do?|bw     |en  |
  | en_BY       | en-by           | shipEntryAction.do?|by     |en  |
  | en_BZ       | en-bz           | shipEntryAction.do?|bz     |en  |
  | en_CA       | en-ca           | shipEntryAction.do?|ca     |en  |
  | en_CH       | en-ch           | shipEntryAction.do?|ch     |en  |
  | en_CI       | en-ci           | shipEntryAction.do?|ci     |en  |
  | en_CL       | en-cl           | shipEntryAction.do?|cl     |en  |
  | en_CO       | en-co           | shipEntryAction.do?|co     |en  |
  | en_CR       | en_cr           | shipEntryAction.do?|cr     |en  |
  | en_CW       | en-cw           | shipEntryAction.do?|cw     |en  |
  | en_CY       | en-cy           | shipEntryAction.do?|cy     |en  |
  | en_CZ       | en_cz           | shipEntryAction.do?|cz     |en  |
  | en_DE       | en_de           | shipEntryAction.do?|de     |en  |
  | en_DJ       | en-dj           | shipEntryAction.do?|dj     |en  |
  | en_DK       | en_dk           | shipEntryAction.do?|dk     |en  |
  | en_DM       | en-dm           | shipEntryAction.do?|dm     |en  |
  | en_DO       | en-do           | shipEntryAction.do?|do     |en  |
  | en_DZ       | en-dz           | shipEntryAction.do?|dz     |en  |
  | en_EC       | en-ec           | shipEntryAction.do?|ec     |en  |
  | en_EE       | en-ee           | shipEntryAction.do?|ee     |en  |
  | en_EG       | en-eg           | shipEntryAction.do?|eg     |en  |
  | en_ES       | en_es           | shipEntryAction.do?|es     |en  |
  | en_ET       | en-et           | shipEntryAction.do?|et     |en  |
  | en_FI       | en_fi           | shipEntryAction.do?|fi     |en  |
  | en_FR       | en_fr           | shipEntryAction.do?|fr     |en  |
  | en_GB       | en-gb           | shipEntryAction.do?|gb     |en  |
  | en_GD       | en-gd           | shipEntryAction.do?|gd     |en  |
  | en_GE       | en-ge           | shipEntryAction.do?|ge     |en  |
  | en_GF       | en-gf           | shipEntryAction.do?|gf     |en  |
  | en_GH       | en-gh           | shipEntryAction.do?|gh     |en  |
  | en_GI       | en-gi           | shipEntryAction.do?|gi     |en  |
  | en_GP       | en-gp           | shipEntryAction.do?|gp     |en  |
  | en_GR       | en-gr           | shipEntryAction.do?|gr     |en  |
  | en_GT       | en-gt           | shipEntryAction.do?|gt     |en  |
  | es_AR       | es-ar           | shipEntryAction.do?|ar     |es  |
  | es_BO       | es-bo           | shipEntryAction.do?|bo     |es  |
  | es_CL       | es-cl           | shipEntryAction.do?|cl     |es  |
  | es_CO       | es-co           | shipEntryAction.do?|co     |es  |
  | es_CR       | es-cr           | shipEntryAction.do?|cr     |es  |
  | es_DO       | es-do           | shipEntryAction.do?|do     |es  |
  | es_EC       | es-ec           | shipEntryAction.do?|ec     |es  |
  | es_ES       | es-es           | shipEntryAction.do?|es     |es  |
  | es_GT       | es-gt           | shipEntryAction.do?|gt     |es  |
  | es_HN       | es-hn           | shipEntryAction.do?|hn     |es  |
  | es_NI       | es-ni           | shipEntryAction.do?|ni     |es  |
  | es_PA       | es-pa           | shipEntryAction.do?|pa     |es  |
  | es_PE       | es-pe           | shipEntryAction.do?|pe     |es  |
  | es_PR       | es-pr           | shipEntryAction.do?|pr     |es  |
  | es_PY       | es-py           | shipEntryAction.do?|py     |es  |
  | es_SV       | es-sv           | shipEntryAction.do?|sv     |es  |
  | es_US       | es_us           | shipEntryAction.do?|us     |es  |
  | es_UY       | es-uy           | shipEntryAction.do?|uy     |es  |
  | es_VE       | es-ve           | shipEntryAction.do?|ve     |es  |
  | fi_FI       | fi-fi           | shipEntryAction.do?|fi     |fi  |
  | fr_BE       | fr-be           | shipEntryAction.do?|be     |fr  |
  | fr_CA       | fr-ca           | shipEntryAction.do?|ca     |fr  |
  | fr_CH       | fr-ch           | shipEntryAction.do?|ch     |fr  |
  | fr_FR       | fr-fr           | shipEntryAction.do?|fr     |fr  |
  | fr_GP       | fr-gp           | shipEntryAction.do?|gp     |fr  |
  | fr_HT       | fr-ht           | shipEntryAction.do?|ht     |fr  |
  | fr_MQ       | fr-mq           | shipEntryAction.do?|mq     |fr  |
  | hu_HU       | hu-hu           | shipEntryAction.do?|hu     |hu  |
  | it_CH       | it-ch           | shipEntryAction.do?|ch     |it  |
  | it_IT       | it-it           | shipEntryAction.do?|it     |it  |
  | he_IL       | iw_il           | shipEntryAction.do?|il     |iw  |
  | nl_BE       | nl_be           | shipEntryAction.do?|be     |nl  |
  | nl_NL       | nl-nl           | shipEntryAction.do?|nl     |nl  |
  | no_NO       | no-no           | shipEntryAction.do?|np     |no  |
  | pl_PL       | pl-pl           | shipEntryAction.do?|pl     |pl  |
  | pt_BR       | pt-br           | shipEntryAction.do?|br     |pt  |
  | pt_PT       | pt-pt           | shipEntryAction.do?|pt     |pt  |
  | ru_RU       | ru-ru           | shipEntryAction.do?|ru     |ru  |
  | sk_SK       | sk-sk           | shipEntryAction.do?|sk     |sk  |
  | sl_SI       | sl-si           | shipEntryAction.do?|si     |sl  |
  | sv_SE       | sv-se           | shipEntryAction.do?|se     |sv  |
  | tr_TR       | tr-tr           | shipEntryAction.do?|tr     |tr  |


  @login
  Scenario Outline: Validate MAGS enabled locale + non MAGS eligible customer are directed to legacy tool
    Given I browse to MAGR application
    And As a "NonMAGSUser" user I login locally using one of the tests env
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
    # And the origin and language is set to "<country>" and "<lang>"
  Examples:
    |locale|application    |returnLocale|
    |en_AL |lite-ship.html?|en_al       |
    |en_AM |lite-ship.html?|en_am       |
    |en_AU |lite-ship.html?|en_au       |
    |en_AZ |lite-ship.html?|en_az       |
    |en_BH |lite-ship.html?|en_bh       |
    |en_BD |lite-ship.html?|en_bd       |
    |en_BY |lite-ship.html?|en_by       |
    |en_BE |lite-ship.html?|en_be       |
    |fr_BE |lite-ship.html?|fr_be       |
    |nl_BE |lite-ship.html?|nl_be       |
    |en_BA |lite-ship.html?|en_ba       |
    |en_BN |lite-ship.html?|en_bn       |
    |en_BG |lite-ship.html?|en_bg       |
    |bg_BG |lite-ship.html?|bg_bg       |
    |en_KH |lite-ship.html?|en_kh       |
    |en_HR |lite-ship.html?|en_hr       |
    |en_CY |lite-ship.html?|en_cy       |
    |cs_CZ |lite-ship.html?|cs_cz       |
    |en_CZ |lite-ship.html?|en_cz       |
    |en_EG |lite-ship.html?|en_eg       |
    |en_ET |lite-ship.html?|en_et       |
    |en_GE |lite-ship.html?|en_ge       |
    |en_GH |lite-ship.html?|en_gh       |
    |en_GI |lite-ship.html?|en_gi       |
    |en_GU |lite-ship.html?|en_gu       |
    |zh_HK |lite-ship.html?|zh_hk       |
    |en_HK |lite-ship.html?|en_hk       |
    |en_IS |lite-ship.html?|en_is       |
    |en_IN |lite-ship.html?|en_in       |
    |en_CI |lite-ship.html?|en_ci       |
    |ja_JP |lite-ship.html?|ja_jp       |
    |en_JP |lite-ship.html?|en_jp       |
    |en_JO |lite-ship.html?|en_jo       |
    |ko_KR |lite-ship.html?|ko_kr       |
    |en_KR |lite-ship.html?|en_kr       |
    |en_KW |lite-ship.html?|en_kw       |
    |en_LB |lite-ship.html?|en_lb       |
    |en_LU |lite-ship.html?|en_lu       |
    |en_MO |lite-ship.html?|en_mo       |
    |en_MK |lite-ship.html?|en_mk       |
    |en_MY |lite-ship.html?|en_my       |
    |en_MT |lite-ship.html?|en_mt       |
    |en_MU |lite-ship.html?|en_mu       |
    |en_MD |lite-ship.html?|en_md       |
    |en_ME |lite-ship.html?|en_me       |
    |en_MA |lite-ship.html?|en_ma       |
    |en_NP |lite-ship.html?|en_np       |
    |nl_NL |lite-ship.html?|nl_nl       |
    |en_NL |lite-ship.html?|en_nl       |
    |en_NZ |lite-ship.html?|en_nz       |
    |en_NG |lite-ship.html?|en_ng       |
    |en_PK |lite-ship.html?|en_pk       |
    |en_PH |lite-ship.html?|en_ph       |
    |pl_PL |lite-ship.html?|pl_pl       |
    |en_PL |lite-ship.html?|en_pl       |
    |en_QA |lite-ship.html?|en_qa       |
    |en_RO |lite-ship.html?|en_ro       |
    |ro_RO |lite-ship.html?|ro_ro       |
    |en_SA |lite-ship.html?|en_sa       |
    |en_RS |lite-ship.html?|en_rs       |
    |en_SG |lite-ship.html?|en_sg       |
    |en_LK |lite-ship.html?|en_lk       |
    |th_TH |lite-ship.html?|th_th       |
    |en_TH |lite-ship.html?|en_th       |
    |en_AE |lite-ship.html?|en_ae       |
    |en_UA |lite-ship.html?|en_ua       |
    |ua_UA |lite-ship.html?|ua_ua       |
    |vi_VN |lite-ship.html?|vi_vn       |
    |en_VN |lite-ship.html?|en_vn       |
    |en_ZW |lite-ship.html?|en_zw       |


 @login
 Scenario Outline: Validate MAGS enabled locale + non MAGS eligible customer are directed to legacy tool
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
    Then I am redirected to "<application>" where the locale is set to "<returnLocale>" 
  Examples:
    |locale|application    |returnLocale|
    |en_AL |lite-ship.html?|en_al       |
    |en_AM |lite-ship.html?|en_am       |
    |en_AU |lite-ship.html?|en_au       |
    |en_AZ |lite-ship.html?|en_az       |
    |en_BH |lite-ship.html?|en_bh       |
    |en_BD |lite-ship.html?|en_bd       |
    |en_BY |lite-ship.html?|en_by       |
    |en_BE |lite-ship.html?|en_be       |
    |fr_BE |lite-ship.html?|fr_be       |
    |nl_BE |lite-ship.html?|nl_be       |
    |en_BA |lite-ship.html?|en_ba       |
    |en_BN |lite-ship.html?|en_bn       |
    |en_BG |lite-ship.html?|en_bg       |
    |bg_BG |lite-ship.html?|bg_bg       |
    |en_KH |lite-ship.html?|en_kh       |
    |en_HR |lite-ship.html?|en_hr       |
    |en_CY |lite-ship.html?|en_cy       |
    |cs_CZ |lite-ship.html?|cs_cz       |
    |en_CZ |lite-ship.html?|en_cz       |
    |en_EG |lite-ship.html?|en_eg       |
    |en_ET |lite-ship.html?|en_et       |
    |en_GE |lite-ship.html?|en_ge       |
    |en_GH |lite-ship.html?|en_gh       |
    |en_GI |lite-ship.html?|en_gi       |
    |en_GU |lite-ship.html?|en_gu       |
    |zh_HK |lite-ship.html?|zh_hk       |
    |en_HK |lite-ship.html?|en_hk       |
    |en_IS |lite-ship.html?|en_is       |
    |en_IN |lite-ship.html?|en_in       |
    |en_CI |lite-ship.html?|en_ci       |
    |ja_JP |lite-ship.html?|ja_jp       |
    |en_JP |lite-ship.html?|en_jp       |
    |en_JO |lite-ship.html?|en_jo       |
    |ko_KR |lite-ship.html?|ko_kr       |
    |en_KR |lite-ship.html?|en_kr       |
    |en_KW |lite-ship.html?|en_kw       |
    |en_LB |lite-ship.html?|en_lb       |
    |en_LU |lite-ship.html?|en_lu       |
    |en_MO |lite-ship.html?|en_mo       |
    |en_MK |lite-ship.html?|en_mk       |
    |en_MY |lite-ship.html?|en_my       |
    |en_MT |lite-ship.html?|en_mt       |
    |en_MU |lite-ship.html?|en_mu       |
    |en_MD |lite-ship.html?|en_md       |
    |en_ME |lite-ship.html?|en_me       |
    |en_MA |lite-ship.html?|en_ma       |
    |en_NP |lite-ship.html?|en_np       |
    |nl_NL |lite-ship.html?|nl_nl       |
    |en_NL |lite-ship.html?|en_nl       |
    |en_NZ |lite-ship.html?|en_nz       |
    |en_NG |lite-ship.html?|en_ng       |
    |en_PK |lite-ship.html?|en_pk       |
    |en_PH |lite-ship.html?|en_ph       |
    |pl_PL |lite-ship.html?|pl_pl       |
    |en_PL |lite-ship.html?|en_pl       |
    |en_QA |lite-ship.html?|en_qa       |
    |en_RO |lite-ship.html?|en_ro       |
    |ro_RO |lite-ship.html?|ro_ro       |
    |en_SA |lite-ship.html?|en_sa       |
    |en_RS |lite-ship.html?|en_rs       |
    |en_SG |lite-ship.html?|en_sg       |
    |en_LK |lite-ship.html?|en_lk       |
    |th_TH |lite-ship.html?|th_th       |
    |en_TH |lite-ship.html?|en_th       |
    |en_AE |lite-ship.html?|en_ae       |
    |en_UA |lite-ship.html?|en_ua       |
    |ua_UA |lite-ship.html?|ua_ua       |
    |vi_VN |lite-ship.html?|vi_vn       |
    |en_VN |lite-ship.html?|en_vn       |
    |en_ZW |lite-ship.html?|en_zw       |

