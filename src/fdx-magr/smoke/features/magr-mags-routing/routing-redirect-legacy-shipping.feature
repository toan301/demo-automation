@redirect @routing @L6Tests
Feature: Validate redirects of for locales to Legacy Shipping page MAGR > MAGS 

Scenario Outline: Validate redirect for locales to legacy Shipping Lite Page - SINGLE package
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
  And the origin and language is set to "<country>" and "<lang>" for "Single" packages
  And I assert page title is not 404
  Examples:
  | locale      | returnLocale    | application        |country|lang|
  | ar_AE       | ar-ae           | lite-ship.html     |ae     |ar  |
  | cs_CZ       | cs-cz           | lite-ship.html     |cz     |cs  |
  | da_DK       | da-dk           | lite-ship.html     |dk     |da  |
  | de_AT       | de-at           | lite-ship.html     |at     |de  |
  | de_CH       | de-ch           | lite-ship.html     |ch     |de  |
  | de_DE       | de-de           | lite-ship.html     |de     |de  |
  | en_AE       | en-ae           | lite-ship.html     |ae     |en  |
  | en_AF       | en-af           | lite-ship.html     |af     |en  |
  | en_AL       | en-al           | lite-ship.html     |al     |en  |
  | en_AM       | en-am           | lite-ship.html     |am     |en  |
  | en_AO       | en-ao           | lite-ship.html     |ao     |en  |
  | en_AR       | en-ar           | lite-ship.html     |ar     |en  |
  | en_AT       | en-at           | lite-ship.html     |at     |en  |
  | en_AZ       | en-az           | lite-ship.html     |az     |en  |
  | en_BA       | en-ba           | lite-ship.html     |ba     |en  |
  | en_BB       | en-bb           | lite-ship.html     |bb     |en  |
  | en_BD       | en-bd           | lite-ship.html     |bd     |en  |
  | en_BE       | en-be           | lite-ship.html     |be     |en  |
  | en_BG       | en-bg           | lite-ship.html     |bg     |en  |
  | en_BH       | en-bh           | lite-ship.html     |bh     |en  |
  | en_BI       | en-bi           | lite-ship.html     |bi     |en  |
  | en_BM       | en-bm           | lite-ship.html     |bm     |en  |
  | en_BO       | en-bo           | lite-ship.html     |bo     |en  |
  | en_BQ       | en-bq           | lite-ship.html     |bq     |en  |
  | en_BR       | en-br           | lite-ship.html     |br     |en  |
  | en_BS       | en-bs           | lite-ship.html     |bs     |en  |
  | en_BW       | en-bw           | lite-ship.html     |bw     |en  |
  | en_BY       | en-by           | lite-ship.html     |by     |en  |
  | en_BZ       | en-bz           | lite-ship.html     |bz     |en  |
  | en_CA       | en-ca           | lite-ship.html     |ca     |en  |
  | en_CH       | en-ch           | lite-ship.html     |ch     |en  |
  | en_CI       | en-ci           | lite-ship.html     |ci     |en  |
  | en_CL       | en-cl           | lite-ship.html     |cl     |en  |
  | en_CO       | en-co           | lite-ship.html     |co     |en  |
  | en_CR       | en_cr           | lite-ship.html     |cr     |en  |
  | en_CW       | en-cw           | lite-ship.html     |cw     |en  |
  | en_CY       | en-cy           | lite-ship.html     |cy     |en  |
  | en_CZ       | en_cz           | lite-ship.html     |cz     |en  |
  | en_DE       | en_de           | lite-ship.html     |de     |en  |
  | en_DJ       | en-dj           | lite-ship.html     |dj     |en  |
  | en_DK       | en_dk           | lite-ship.html     |dk     |en  |
  | en_DM       | en-dm           | lite-ship.html     |dm     |en  |
  | en_DO       | en-do           | lite-ship.html     |do     |en  |
  | en_DZ       | en-dz           | lite-ship.html     |dz     |en  |
  | en_EC       | en-ec           | lite-ship.html     |ec     |en  |
  | en_EE       | en-ee           | lite-ship.html     |ee     |en  |
  | en_EG       | en-eg           | lite-ship.html     |eg     |en  |
  | en_ES       | en_es           | lite-ship.html     |es     |en  |
  | en_ET       | en-et           | lite-ship.html     |et     |en  |
  | en_FI       | en_fi           | lite-ship.html     |fi     |en  |
  | en_FR       | en_fr           | lite-ship.html     |fr     |en  |
  | en_GB       | en-gb           | lite-ship.html     |gb     |en  |
  | en_GD       | en-gd           | lite-ship.html     |gd     |en  |
  | en_GE       | en-ge           | lite-ship.html     |ge     |en  |
  | en_GF       | en-gf           | lite-ship.html     |gf     |en  |
  | en_GH       | en-gh           | lite-ship.html     |gh     |en  |
  | en_GI       | en-gi           | lite-ship.html     |gi     |en  |
  | en_GP       | en-gp           | lite-ship.html     |gp     |en  |
  | en_GR       | en-gr           | lite-ship.html     |gr     |en  |
  | en_GT       | en-gt           | lite-ship.html     |gt     |en  |
  | es_AR       | es-ar           | lite-ship.html     |ar     |es  |
  | es_BO       | es-bo           | lite-ship.html     |bo     |es  |
  | es_CL       | es-cl           | lite-ship.html     |cl     |es  |
  | es_CO       | es-co           | lite-ship.html     |co     |es  |
  | es_CR       | es-cr           | lite-ship.html     |cr     |es  |
  | es_DO       | es-do           | lite-ship.html     |do     |es  |
  | es_EC       | es-ec           | lite-ship.html     |ec     |es  |
  | es_ES       | es-es           | lite-ship.html     |es     |es  |
  | es_GT       | es-gt           | lite-ship.html     |gt     |es  |
  | es_HN       | es-hn           | lite-ship.html     |hn     |es  |
  | es_NI       | es-ni           | lite-ship.html     |ni     |es  |
  | es_PA       | es-pa           | lite-ship.html     |pa     |es  |
  | es_PE       | es-pe           | lite-ship.html     |pe     |es  |
  | es_PR       | es-pr           | lite-ship.html     |pr     |es  |
  | es_PY       | es-py           | lite-ship.html     |py     |es  |
  | es_SV       | es-sv           | lite-ship.html     |sv     |es  |
  | es_US       | es_us           | lite-ship.html     |us     |es  |
  | es_UY       | es-uy           | lite-ship.html     |uy     |es  |
  # | es_VE       | es-ve           | lite-ship.html     |ve     |es  |
  | fi_FI       | fi-fi           | lite-ship.html     |fi     |fi  |
  | fr_BE       | fr-be           | lite-ship.html     |be     |fr  |
  | fr_CA       | fr-ca           | lite-ship.html     |ca     |fr  |
  | fr_CH       | fr-ch           | lite-ship.html     |ch     |fr  |
  | fr_FR       | fr-fr           | lite-ship.html     |fr     |fr  |
  | fr_GP       | fr-gp           | lite-ship.html     |gp     |fr  |
  | fr_HT       | fr-ht           | lite-ship.html     |ht     |fr  |
  | fr_MQ       | fr-mq           | lite-ship.html     |mq     |fr  |
  | hu_HU       | hu-hu           | lite-ship.html     |hu     |hu  |
  | it_CH       | it-ch           | lite-ship.html     |ch     |it  |
  | it_IT       | it-it           | lite-ship.html     |it     |it  |
  | he_IL       | iw_il           | lite-ship.html     |il     |iw  |
  | nl_BE       | nl_be           | lite-ship.html     |be     |nl  |
  | nl_NL       | nl-nl           | lite-ship.html     |nl     |nl  |
  | no_NO       | no-no           | lite-ship.html     |no     |no  |
  | pl_PL       | pl-pl           | lite-ship.html     |pl     |pl  |
  | pt_BR       | pt-br           | lite-ship.html     |br     |pt  |
  | pt_PT       | pt-pt           | lite-ship.html     |pt     |pt  |
  | ru_RU       | ru-ru           | lite-ship.html     |ru     |ru  |
  | sk_SK       | sk-sk           | lite-ship.html     |sk     |sk  |
  | sl_SI       | sl-si           | lite-ship.html     |si     |sl  |
  | sv_SE       | sv-se           | lite-ship.html     |se     |sv  |
  | tr_TR       | tr-tr           | lite-ship.html     |tr     |tr  |


Scenario Outline: Validate redirect for locales to legacy Shipping Page - MULTIPLE package
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
  Then I am redirected to "<application>" 
  And the origin and language is set to "<country>" and "<lang>" for "Multiple" packages
  And I assert page title is not 404
  Examples:
  | locale      | application        |country|lang|
  | ar_AE       | shipEntryAction.do?|ae     |ar  |
  | cs_CZ       | shipEntryAction.do?|cz     |cs  |
  | da_DK       | shipEntryAction.do?|dk     |da  |
  | de_AT       | shipEntryAction.do?|at     |de  |
  | de_CH       | shipEntryAction.do?|ch     |de  |
  | de_DE       | shipEntryAction.do?|de     |de  |
  | en_AE       | shipEntryAction.do?|ae     |en  |
  | en_AF       | shipEntryAction.do?|af     |en  |
  | en_AL       | shipEntryAction.do?|al     |en  |
  | en_AM       | shipEntryAction.do?|am     |en  |
  | en_AO       | shipEntryAction.do?|ao     |en  |
  | en_AR       | shipEntryAction.do?|ar     |en  |
  | en_AT       | shipEntryAction.do?|at     |en  |
  | en_AZ       | shipEntryAction.do?|az     |en  |
  | en_BA       | shipEntryAction.do?|ba     |en  |
  | en_BB       | shipEntryAction.do?|bb     |en  |
  | en_BD       | shipEntryAction.do?|bd     |en  |
  | en_BE       | shipEntryAction.do?|be     |en  |
  | en_BG       | shipEntryAction.do?|bg     |en  |
  | en_BH       | shipEntryAction.do?|bh     |en  |
  | en_BI       | shipEntryAction.do?|bi     |en  |
  | en_BM       | shipEntryAction.do?|bm     |en  |
  | en_BO       | shipEntryAction.do?|bo     |en  |
  | en_BQ       | shipEntryAction.do?|bq     |en  |
  | en_BR       | shipEntryAction.do?|br     |en  |
  | en_BS       | shipEntryAction.do?|bs     |en  |
  | en_BW       | shipEntryAction.do?|bw     |en  |
  | en_BY       | shipEntryAction.do?|by     |en  |
  | en_BZ       | shipEntryAction.do?|bz     |en  |
  | en_CA       | shipEntryAction.do?|ca     |en  |
  | en_CH       | shipEntryAction.do?|ch     |en  |
  | en_CI       | shipEntryAction.do?|ci     |en  |
  | en_CL       | shipEntryAction.do?|cl     |en  |
  | en_CO       | shipEntryAction.do?|co     |en  |
  | en_CR       | shipEntryAction.do?|cr     |en  |
  | en_CW       | shipEntryAction.do?|cw     |en  |
  | en_CY       | shipEntryAction.do?|cy     |en  |
  | en_CZ       | shipEntryAction.do?|cz     |en  |
  | en_DE       | shipEntryAction.do?|de     |en  |
  | en_DJ       | shipEntryAction.do?|dj     |en  |
  | en_DK       | shipEntryAction.do?|dk     |en  |
  | en_DM       | shipEntryAction.do?|dm     |en  |
  | en_DO       | shipEntryAction.do?|do     |en  |
  | en_DZ       | shipEntryAction.do?|dz     |en  |
  | en_EC       | shipEntryAction.do?|ec     |en  |
  | en_EE       | shipEntryAction.do?|ee     |en  |
  | en_EG       | shipEntryAction.do?|eg     |en  |
  | en_ES       | shipEntryAction.do?|es     |en  |
  | en_ET       | shipEntryAction.do?|et     |en  |
  | en_FI       | shipEntryAction.do?|fi     |en  |
  | en_FR       | shipEntryAction.do?|fr     |en  |
  | en_GB       | shipEntryAction.do?|gb     |en  |
  | en_GD       | shipEntryAction.do?|gd     |en  |
  | en_GE       | shipEntryAction.do?|ge     |en  |
  | en_GF       | shipEntryAction.do?|gf     |en  |
  | en_GH       | shipEntryAction.do?|gh     |en  |
  | en_GI       | shipEntryAction.do?|gi     |en  |
  | en_GP       | shipEntryAction.do?|gp     |en  |
  | en_GR       | shipEntryAction.do?|gr     |en  |
  | en_GT       | shipEntryAction.do?|gt     |en  |
  | es_AR       | shipEntryAction.do?|ar     |es  |
  | es_BO       | shipEntryAction.do?|bo     |es  |
  | es_CL       | shipEntryAction.do?|cl     |es  |
  | es_CO       | shipEntryAction.do?|co     |es  |
  | es_CR       | shipEntryAction.do?|cr     |es  |
  | es_DO       | shipEntryAction.do?|do     |es  |
  | es_EC       | shipEntryAction.do?|ec     |es  |
  | es_ES       | shipEntryAction.do?|es     |es  |
  | es_GT       | shipEntryAction.do?|gt     |es  |
  | es_HN       | shipEntryAction.do?|hn     |es  |
  | es_NI       | shipEntryAction.do?|ni     |es  |
  | es_PA       | shipEntryAction.do?|pa     |es  |
  | es_PE       | shipEntryAction.do?|pe     |es  |
  | es_PR       | shipEntryAction.do?|pr     |es  |
  | es_PY       | shipEntryAction.do?|py     |es  |
  | es_SV       | shipEntryAction.do?|sv     |es  |
  | es_US       | shipEntryAction.do?|us     |es  |
  | es_UY       | shipEntryAction.do?|uy     |es  |
  | es_VE       | shipEntryAction.do?|ve     |es  |
  | fi_FI       | shipEntryAction.do?|fi     |fi  |
  | fr_BE       | shipEntryAction.do?|be     |fr  |
  | fr_CA       | shipEntryAction.do?|ca     |fr  |
  | fr_CH       | shipEntryAction.do?|ch     |fr  |
  | fr_FR       | shipEntryAction.do?|fr     |fr  |
  | fr_GP       | shipEntryAction.do?|gp     |fr  |
  | fr_HT       | shipEntryAction.do?|ht     |fr  |
  | fr_MQ       | shipEntryAction.do?|mq     |fr  |
  | hu_HU       | shipEntryAction.do?|hu     |hu  |
  | it_CH       | shipEntryAction.do?|ch     |it  |
  | it_IT       | shipEntryAction.do?|it     |it  |
  | he_IL       | shipEntryAction.do?|il     |iw  |
  | nl_BE       | shipEntryAction.do?|be     |nl  |
  | nl_NL       | shipEntryAction.do?|nl     |nl  |
  | no_NO       | shipEntryAction.do?|np     |no  |
  | pl_PL       | shipEntryAction.do?|pl     |pl  |
  | pt_BR       | shipEntryAction.do?|br     |pt  |
  | pt_PT       | shipEntryAction.do?|pt     |pt  |
  | ru_RU       | shipEntryAction.do?|ru     |ru  |
  | sk_SK       | shipEntryAction.do?|sk     |sk  |
  | sl_SI       | shipEntryAction.do?|si     |sl  |
  | sv_SE       | shipEntryAction.do?|se     |sv  |
  | tr_TR       | shipEntryAction.do?|tr     |tr  |




Scenario Outline: Validate redirect for locales to legacyShipping Page - SINGLE package (LAC & APAC)
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
  And the origin and language is set to "<country>" and "<lang>" for "Single" packages
  And I assert page title is not 404
  Examples:
    |locale|application|country	|	lang|
    |en_MX|shipEntryAction.do?|mx|en|
    |es_MX|shipEntryAction.do?|mx|es|
    |en_AU|shipEntryAction.do?|au|en|
    |en_BN|shipEntryAction.do?|bn|en|
    |zh_CN|shipEntryAction.do?|cn|zh|
    |en_CN|shipEntryAction.do?|cn|en|
    |en_GU|shipEntryAction.do?|gu|en|
    |zh_HK|shipEntryAction.do?|hk|zh|
    |en_HK|shipEntryAction.do?|hk|en|
    |en_ID|shipEntryAction.do?|id|en|
    |ja_JP|shipEntryAction.do?|jp|ja|
    |en_JP|shipEntryAction.do?|jp|en|
    |en_KH|shipEntryAction.do?|kh|en|
    |ko_KR|shipEntryAction.do?|kr|ko|
    |en_KR|shipEntryAction.do?|kr|en|
    |en_LA|shipEntryAction.do?|la|en|
    |en_MO|shipEntryAction.do?|mo|en|
    |en_MY|shipEntryAction.do?|my|en|
    |en_NZ|shipEntryAction.do?|nz|en|
    |en_PH|shipEntryAction.do?|ph|en|
    |en_SG|shipEntryAction.do?|sg|en|
    |en_TH|shipEntryAction.do?|th|en|
    |th_TH|shipEntryAction.do?|th|th|
    |zh_TW|shipEntryAction.do?|tw|zh|
    |en_TW|shipEntryAction.do?|tw|en|
    |en_VN|shipEntryAction.do?|vn|en|
    |vi_VN|shipEntryAction.do?|vn|vi|


Scenario Outline: Validate redirect for locales to legacyShipping Page - MULTI package (LAC & APAC)
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
  Then I am redirected to "<application>"
  And the origin and language is set to "<country>" and "<lang>" for "Multiple" packages
  And I assert page title is not 404
  Examples:
    |locale|application|country	|	lang|
    |en_MX|shipEntryAction.do?|mx|en|
    |es_MX|shipEntryAction.do?|mx|es|
    |en_AU|shipEntryAction.do?|au|en|
    |en_BN|shipEntryAction.do?|bn|en|
    |zh_CN|shipEntryAction.do?|cn|zh|
    |en_CN|shipEntryAction.do?|cn|en|
    |en_GU|shipEntryAction.do?|gu|en|
    |zh_HK|shipEntryAction.do?|hk|zh|
    |en_HK|shipEntryAction.do?|hk|en|
    |en_ID|shipEntryAction.do?|id|en|
    |ja_JP|shipEntryAction.do?|jp|ja|
    |en_JP|shipEntryAction.do?|jp|en|
    |en_KH|shipEntryAction.do?|kh|en|
    |ko_KR|shipEntryAction.do?|kr|ko|
    |en_KR|shipEntryAction.do?|kr|en|
    |en_LA|shipEntryAction.do?|la|en|
    |en_MO|shipEntryAction.do?|mo|en|
    |en_MY|shipEntryAction.do?|my|en|
    |en_NZ|shipEntryAction.do?|nz|en|
    |en_PH|shipEntryAction.do?|ph|en|
    |en_SG|shipEntryAction.do?|sg|en|
    |en_TH|shipEntryAction.do?|th|en|
    |th_TH|shipEntryAction.do?|th|th|
    |zh_TW|shipEntryAction.do?|tw|zh|
    |en_TW|shipEntryAction.do?|tw|en|
    |en_VN|shipEntryAction.do?|vn|en|
    |vi_VN|shipEntryAction.do?|vn|vi|
