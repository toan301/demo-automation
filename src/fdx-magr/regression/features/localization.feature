@magr @localization @regression
Feature: Support language of our customers
  In order to understand the rating application
  As a Customer
  I want to view it in my own language

#  Scenario Outline: 01 - Check app translation for <country> [<region>]
#    Given I browse to MAGR application
#    When "<status>" equals "true" I change my locale to "<locale>"
#    Then application is translated based on translation "<fileName>"
#    Examples: MAGR locales file
#      | region | country            | locale | fileName   | status |
#      | APAC   | China              | en_CN  | en.json    | true   |
#      | APAC   | China              | zh_CN  | zh_CN.json | true   |
#      | APAC   | Japan              | ja_JP  | ja.json    | true   |
#      | APAC   | Taiwan             | zh_TW  | zh_TW.json | true   |
#      | APAC   | Thailand           | th_TH  | th.json    | true   |
#      | CA     | Canada             | fr_CA  | fr_CA.json | true   |
#      | EU     | Bulgaria           | bg_BG  | en.json    | true   |
#      | EU     | Estonia            | ee_EE  | en.json    | true   |
#      | EU     | Poland             | pl_PL  | pl.json    | true   |
#      | EU     | Romania            | ro_RO  | en.json    | true   |
#      | EU     | Ukraine            | ua_UA  | en.json    | true   |
#      | LAC    | Argentina          | es_AR  | es.json    | true   |
#      | LAC    | Brazil             | pt_BR  | pt_BR.json | true   |
#      | LAC    | Chile              | es_CL  | es.json    | true   |
#      | LAC    | Colombia           | es_CO  | es.json    | true   |
#      | LAC    | Costa Rica         | es_CR  | es.json    | true   |
#      | LAC    | Dominican Republic | es_DO  | es.json    | true   |
#      | LAC    | Ecuador            | es_EC  | es.json    | true   |
#      | LAC    | El Salvador        | es_SV  | es.json    | true   |
#      | LAC    | Guadeloupe         | fr_GP  | fr.json    | true   |
#      | LAC    | Guatemala          | es_GT  | es.json    | true   |
#      | LAC    | Haiti              | fr_HT  | fr.json    | true   |
#      | LAC    | Honduras           | es_HN  | es.json    | true   |
#      | LAC    | Martinique         | fr_MQ  | fr.json    | true   |
#      | LAC    | Mexico             | es_MX  | es.json    | true   |
#      | LAC    | Nicaragua          | es_NI  | es.json    | true   |
#      | LAC    | Panama             | es_PA  | es.json    | true   |
#      | LAC    | Paraguay           | es_PY  | es.json    | true   |
#      | LAC    | Peru               | es_PE  | es.json    | true   |
#      | LAC    | Puerto Rico        | es_PR  | es.json    | true   |
#      | LAC    | Uruguay            | es_UY  | es.json    | true   |
#      | LAC    | Venezuela          | es_VE  | es.json    | true   |
#      | US     | U.S.A.             | es_US  | es.json    | true   |

#  Scenario Outline: 02 - verify rates for: <locale> [<packageType>]
#    And "<status>" equals "true" I change my locale to "<locale>"
#    When I ship from the "<fromAddress>" address in "<fromCountry>"
#    When I ship to the "<toAddress>" address in "<toCountry>"
#    And I am shipping one "<packageType>" weighing 9 "KG"
#    When I request rates
#    Then I should see rate quotes table with all the information
#    Examples:
#      | locale | fromAddress         | fromCountry    | toAddress         | toCountry     | packageType           |
#      | en_SK  | 560078, India       | India          | 560078, India     | India         | YOUR_PACKAGING        |
#      | en_ME  | 560078, India       | India          | 560078, India     | India         | YOUR_PACKAGING        |
#      | en_AI  | Dresden, TN 38225   | United States  | Memphis, TN 38106 | United States | FEDEX_EXTRA_LARGE_BOX |
#      | en_UA  | Memphis, TN 38106   | United States  | Memphis, TN 38106 | United States | FEDEX_MEDIUM_BOX      |
#      | en_RO  | TX 75043            | United States  | m1m1m1 canada     | Canada        | FEDEX_SMALL_BOX       |
#      | en_RS  | Memphis, TN 38106   | United States  | m1m1m1 canada     | Canada        | FEDEX_25KG_BOX        |
#      | en_BA  | Memphis, TN 38106   | United States  | Ciudad de México  | Mexico        | FEDEX_LARGE_BOX       |
#      | en_FO  | Memphis, TN 38106   | United States  | central hong kong | Hong kong     | FEDEX_TUBE            |
#      | en_GI  | bejing china        | China          | central hong kong | Hong kong     | FEDEX_TUBE            |
#      | en_BG  | Chuo City, 103-0028 | Japan          | Memphis, TN 38106 | United States | YOUR_PACKAGING        |
#      | en_AW  | Liverpool UK        | United Kingdom | TX 75043          | United States | FEDEX_PAK             |
#      | pl_PL  | 560078, India       | India          | m1m1m1 canada     | Canada        | YOUR_PACKAGING        |
#      | en_AL  | 560078, India       | India          | m1m1m1 canada     | Canada        | YOUR_PACKAGING        |
#      | en_AM  | 560078, India       | India          | m1m1m1 canada     | Canada        | YOUR_PACKAGING        |
#      | en_AZ  | 560078, India       | India          | m1m1m1 canada     | Canada        | YOUR_PACKAGING        |
#      | en_BY  | 560078, India       | India          | m1m1m1 canada     | Canada        | YOUR_PACKAGING        |
#      | en_CY  | 560078, India       | India          | m1m1m1 canada     | Canada        | YOUR_PACKAGING        |
#      | en_SX  | 560078, India       | India          | m1m1m1 canada     | Canada        | YOUR_PACKAGING        |
#      | en_GD  | 560078, India       | India          | m1m1m1 canada     | Canada        | YOUR_PACKAGING        |
#      | en_BG  | 560078, India       | India          | m1m1m1 canada     | Canada        | YOUR_PACKAGING        |
#      | en_MS  | 560078, India       | India          | m1m1m1 canada     | Canada        | YOUR_PACKAGING        |
#      | en_VI  | 560078, India       | India          | m1m1m1 canada     | Canada        | YOUR_PACKAGING        |
#      | en_RS  | 560078, India       | India          | m1m1m1 canada     | Canada        | YOUR_PACKAGING        |
#      | en_RO  | 560078, India       | India          | m1m1m1 canada     | Canada        | YOUR_PACKAGING        |
#      | en_UA  | 560078, India       | India          | m1m1m1 canada     | Canada        | YOUR_PACKAGING        |
#      | en_ME  | 560078, India       | India          | m1m1m1 canada     | Canada        | YOUR_PACKAGING        |
#      | fr_CA  | 560078, India       | India          | m1m1m1 canada     | Canada        | YOUR_PACKAGING        |

  Scenario Outline: 03 - check number formatting for weight and customs field for <country> [<region>]
    Given I browse to MAGR application
    When "<status>" equals "true" I change my locale to "<locale>"
    When I ship from the "Haagweg" address in "Netherlands"
    And I ship to the "38225" address in "United States"
    When I purchase a higher limit of liability
    When the carriage value on package line 1 is "1<decimalSeparator>000<thousandSeparator>50" "<defaultCurrency>"
    Then I see an error message that I should enter a valid carriage value
    When the carriage value on package line 1 is "1<thousandSeparator>000<decimalSeparator>50" "<defaultCurrency>"
    And I set package weight unit to "LB"
    Then I do not see an error message that I should enter a valid carriage value
    When the weight on package line 1 is "1<thousandSeparator>00"
    Then I see an error message that I should enter a valid weight
    When the weight on package line 1 is "1<decimalSeparator>00"
    Then I do not see an error message that I should enter a valid weight

    Examples: MAGR locales
      | region | country            | locale | fileName   | status | thousandSeparator | decimalSeparator | defaultCurrency |
      | APAC   | Am. Samoa          | en_AS  | en.json    | false  | ,                 | .                | USD             |
      | APAC   | Australia          | en_AU  | en.json    | false  | ,                 | .                | AUD             |
      | APAC   | Brunei             | en_BN  | en.json    | false  | ,                 | .                | BND             |
      | APAC   | Cambodia           | en_KH  | en.json    | false  | ,                 | .                | USD             |
      | APAC   | China              | en_CN  | en.json    | true   | ,                 | .                | CNY             |
      | APAC   | China              | zh_CN  | zh_CN.json | true   | ,                 | .                | CNY             |
#      | APAC   | Cook Is.          | en_CK  | en.json| false  |,|.|USD|
#      | APAC   | Fiji              | en_FJ  |en.json| false  |,|.|USD|
#      | APAC   | Fr. Polynesia     | en_PF  |en.json| false  |,|.|USD|
      | APAC   | Guam               | en_GU  | en.json    | true   | ,                 | .                | USD             |
#      | APAC   | Hong Kong         | en_HK  |en.json| false  |,|.|HKD|
#      | APAC   | Hong Kong         | zh_HK  |                                                     | false  |,|.|HKD|
#      | APAC   | Indonesia         | en_ID  |en.json| false  |,|.|USD|
#      | APAC   | Indonesia         | id_ID  |                                                     | false  |,|.|USD|
      | APAC   | Japan              | en_JP  | en.json    | true   | ,                 | .                | JPY             |
      | APAC   | Japan              | ja_JP  | ja.json    | true   | ,                 | .                | JPY             |
#      | APAC   | Korea,South       | en_KR  |en.json| false  |,|.|USD|
#      | APAC   | Korea,South       | ko_KR  |       | false  |,|.|USD|
      | APAC   | Laos               | en_LA  | en.json    | true   | ,                 | .                | USD             |
      | APAC   | Macau              | en_MO  | en.json    | true   | ,                 | .                | MOP             |
      | APAC   | Malaysia           | en_MY  | en.json    | true   | ,                 | .                | MYR             |
#      | APAC   | Marshall Is.      | en_MH  |en.json| false  |,|.|USD|
#      | APAC   | Micronesia        | en_FM  |en.json| false  |,|.|USD|
#      | APAC   | Mongolia          | en_MN  |en.json| false  |,|.|USD|
#      | APAC   | New Caledonia     | en_NC  |en.json| false  |,|.|USD|
      | APAC   | New Zealand        | en_NZ  | en.json    | true   | ,                 | .                | USD             |
#      | APAC   | Palau             | en_PW  |en.json| false  |,|.|USD|
#      | APAC   | Papua New Guinea  | en_PG  |en.json| false  |,|.|USD|
      | APAC   | Philippines        | en_PH  | en.json    | true   | ,                 | .                | USD             |
#      | APAC   | Saipan            | en_MP  |en.json| false  |,|.|USD|
      | APAC   | Singapore          | en_SG  | en.json    | true   | ,                 | .                | USD             |
      | APAC   | Taiwan             | en_TW  | en.json    | true   | ,                 | .                | TWD             |
      | APAC   | Taiwan             | zh_TW  | zh_TW.json | true   | ,                 | .                | TWD             |
      | APAC   | Thailand           | en_TH  | en.json    | true   | ,                 | .                | USD             |
      | APAC   | Thailand           | th_TH  | th.json    | true   | ,                 | .                | USD             |
#      | APAC   | Vanuatu           | en_VU  |en.json| false  |,|.|USD|
#      | APAC   | Vietnam           | en_VN  |en.json| false  |,|.|USD|
#      | APAC   | Vietnam           | vi_VN  |                                                     | false  |,|.|USD|
#      | APAC   | Wallis and Futuna | en_WF  |en.json| false  |,|.|USD|
      | CA     | Canada             | fr_CA  | fr_CA.json | true   | ,                 | .                | CAD             |
      | CA     | Canada             | en_CA  | en.json    | true   | ,                 | .                | CAD             |
      | EU     | Albania            | en_AL  | en.json    | true   | ,                 | .                | USD             |
      | EU     | Armenia            | en_AM  | en.json    | true   | ,                 | .                | USD             |
#      | EU     | Austria           | de_AT  |                                                     | false  |,|.|USD|
#      | EU     | Austria           | en_AT  |en.json| false  |,|.|USD|
      | EU     | Azerbaijan         | en_AZ  | en.json    | true   | ,                 | .                | USD             |
      | EU     | Belarus            | en_BY  | en.json    | true   | ,                 | .                | USD             |
#      | EU     | Belgium           | en_BE  |en.json| false  |.|,|EUR|
#      | EU     | Belgium           | nl_BE  |                                                     | false  |.|,|EUR|
#      | EU     | Belgium           | fr_BE  |                                                     | false  |.|,|EUR|
      | EU     | Bosnia-Herzegovina | en_BA  | en.json    | true   | ,                 | .                | USD             |
      | EU     | Bulgaria           | en_BG  | en.json    | true   | ,                 | .                | USD             |
      | EU     | Bulgaria           | bg_BG  | en.json    | true   | ,                 | .                | USD             |
#      | EU     | Croatia           | en_HR  |en.json| false  |,|.|USD|
      | EU     | Cyprus             | en_CY  | en.json    | true   | ,                 | .                | USD             |
#      | EU     | Czech Rep.        | cs_CZ  |                                                     | false  |.|,|CZK|
#      | EU     | Czech Rep.        | en_CZ  |en.json| false  |.|,|CZK|
#      | EU     | Denmark           | da_DK  |                                                     | false  |.|,|DKK|
#      | EU     | Denmark           | en_DK  |en.json| false  |.|,|DKK|
#      | EU     | Estonia           | en_EE  |en.json| false  |,|.|USD|
      | EU     | Estonia            | ee_EE  | en.json    | true   | ,                 | .                | USD             |
      | EU     | Faroe Is.          | en_FO  | en.json    | true   | ,                 | .                | USD             |
#      | EU     | Finland           | fi_FI  |                                                     | false  | |,|EUR|
#      | EU     | Finland           | en_FI  |en.json| false  | |,|EUR|
#      | EU     | France            | fr_FR  | Donnez-nous des informations sur votre envoi.       | false  |.|,|EUR|
#      | EU     | France            | en_FR  |en.json| false  |.|,|EUR|
      | EU     | Georgia            | en_GE  | en.json    | true   | ,                 | .                | USD             |
#      | EU     | Germany           | de_DE  |                                                     | false  |.|,|EUR|
#      | EU     | Germany           | en_DE  |en.json| false  |.|,|EUR|
      | EU     | Gibraltar          | en_GI  | en.json    | true   | ,                 | .                | USD             |
#      | EU     | Greece            | en_GR  |en.json| false  |,|.|USD|
      | EU     | Greenland          | en_GL  | en.json    | true   | ,                 | .                | USD             |
#      | EU     | Hungary           | hu_HU  |                                                     | false  |.|,|EUR|
#      | EU     | Hungary           | en_HU  |en.json| false  |.|,|EUR|
      | EU     | Iceland            | en_IS  | en.json    | true   | ,                 | .                | USD             |
#      | EU     | Ireland           | en_IE  |en.json| false  |,|.|USD|
#      | EU     | Israel            | en_IL  |en.json| false  |,|.|USD|
#      | EU     | Israel            | he_IL  |                                                     | false  |,|.|USD|
#      | EU     | Italy             | it_IT  |                                                     | false  |.|,|EUR|
#      | EU     | Italy             | en_IT  |en.json| false  |.|,|EUR|
#      | EU     | Latvia            | en_LV  |en.json| false  |,|.|USD|
#      | EU     | Latvia            | lv_LV  |                                                     | false  |,|.|USD|
#      | EU     | Lithuania         | en_LT  |en.json| false  |,|.|USD|
#      | EU     | Lithuania         | lt_LT  |                                                     | false  |,|.|USD|
#      | EU     | Luxembourg        | en_LU  |en.json| false  |,|.|USD|
      | EU     | Macedonia          | en_MK  | en.json    | true   | ,                 | .                | USD             |
#      | EU     | Malta             | en_MT  |en.json| false  |,|.|USD|
      | EU     | Moldova            | en_MD  | en.json    | true   | ,                 | .                | USD             |
      | EU     | Montenegro         | en_ME  | en.json    | true   | ,                 | .                | USD             |
#      | EU     | Netherlands       |  nl_NL  |                                                    | false  |.|,|EUR|
#      | EU     | Netherlands       |  en_NL  |en.json| false  |.|,|EUR|
#      | EU     | Norway            |  en_NO  |en.json| false  | |,|EUR|
#      | EU     | Norway            |  no_NO  |                                                    | false  | |,|EUR|
      | EU     | Poland             | en_PL  | en.json    | true   | ,                 | .                | EUR             |
      | EU     | Poland             | pl_PL  | pl.json    | true   | ,                 | .                | EUR             |
#      | EU     | Portugal          |  en_PT  |en.json| false  |.|,|EUR|
#      | EU     | Portugal          |  pt_PT  |                                                    | false  |.|,|EUR|
      | EU     | Romania            | en_RO  | en.json    | true   | ,                 | .                | USD             |
      | EU     | Romania            | ro_RO  | en.json    | true   | ,                 | .                | USD             |
#      | EU     | Russia            |  en_RU  |en.json| false  |.|,|RUR|
#      | EU     | Russia            |  ru_RU  | Расскажите о своей посылке.                        | false  |.|,|RUR|
      | EU     | Serbia             | en_RS  | en.json    | true   | ,                 | .                | USD             |
      | EU     | Slovak Rep.        | en_SK  | en.json    | true   | ,                 | .                | USD             |
#      | EU     | Slovenia          |  en_SI  |en.json| false  |,|.|USD|
#      | EU     | Slovenia          |  sl_SI  |                                                    | false  |,|.|USD|
#      | EU     | Spain             |  es_ES  | Indique la información de su pedido.               | false  |.|,|EUR|
#      | EU     | Spain             |  en_ES  |en.json| false  |.|,|EUR|
#      | EU     | Sweden            |  sv_SE  |                                                    | false  |.|,|EUR|
#      | EU     | Sweden            |  en_SE  |en.json| false  |.|,|EUR|
#      | EU     | Switzerland       |  fr_CH  |                                                    | false  |,|.|USD|
#      | EU     | Switzerland       |  de_CH  |                                                    | false  |,|.|USD|
#      | EU     | Switzerland       |  it_CH  |                                                    | false  |,|.|USD|
#      | EU     | Switzerland       |  en_CH  |en.json| false  |,|.|USD|
#      | EU     | Turkey            |  en_TR  |en.json| false  |.|,|TRY|
#      | EU     | Turkey            |  tr_TR  | Bize gönderinizden bahsedin.                       | false  |.|,|TRY|
      | EU     | UK                 | en_GB  | en.json    | true   | ,                 | .                | GBP             |
      | EU     | Ukraine            | en_UA  | en.json    | true   | ,                 | .                | USD             |
      | EU     | Ukraine            | ua_UA  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Anguilla           | en_AI  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Antigua            | en_AG  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Argentina          | es_AR  | es.json    | true   | ,                 | .                | USD             |
      | LAC    | Argentina          | en_AR  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Aruba              | en_AW  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Bahamas            | en_BS  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Barbados           | en_BB  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Belize             | en_BZ  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Bermuda            | en_BM  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Bolivia            | es_BO  | es.json    | true   | ,                 | .                | USD             |
      | LAC    | Bolivia            | en_BO  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Bonaire            | en_BQ  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Brazil             | pt_BR  | pt_BR.json | true   | ,                 | .                | BRL             |
      | LAC    | Brazil             | en_BR  | en.json    | true   | ,                 | .                | BRL             |
      | LAC    | British Virgin Is. | en_VG  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Cayman Is.         | en_KY  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Chile              | es_CL  | es.json    | true   | ,                 | .                | USD             |
      | LAC    | Chile              | en_CL  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Colombia           | es_CO  | es.json    | true   | ,                 | .                | USD             |
      | LAC    | Colombia           | en_CO  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Costa Rica         | es_CR  | es.json    | true   | ,                 | .                | USD             |
      | LAC    | Costa Rica         | en_CR  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Curacao            | en_CW  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Dominica           | en_DM  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Dominican Republic | es_DO  | es.json    | true   | ,                 | .                | USD             |
      | LAC    | Dominican Republic | en_DO  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Ecuador            | es_EC  | es.json    | true   | ,                 | .                | USD             |
      | LAC    | Ecuador            | en_EC  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | El Salvador        | es_SV  | es.json    | true   | ,                 | .                | USD             |
      | LAC    | El Salvador        | en_SV  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | French Guiana      | en_GF  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Grenada            | en_GD  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Guadeloupe         | fr_GP  | fr.json    | true   | ,                 | .                | USD             |
      | LAC    | Guadeloupe         | en_GP  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Guatemala          | es_GT  | es.json    | true   | ,                 | .                | USD             |
      | LAC    | Guatemala          | en_GT  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Guyana             | en_GY  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Haiti              | fr_HT  | fr.json    | true   | ,                 | .                | USD             |
      | LAC    | Haiti              | en_HT  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Honduras           | es_HN  | es.json    | true   | ,                 | .                | USD             |
      | LAC    | Honduras           | en_HN  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Jamaica            | en_JM  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Martinique         | fr_MQ  | fr.json    | true   | ,                 | .                | USD             |
      | LAC    | Martinique         | en_MQ  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Mexico             | es_MX  | es.json    | true   | ,                 | .                | MXN             |
      | LAC    | Mexico             | en_MX  | en.json    | true   | ,                 | .                | MXN             |
      | LAC    | Montserrat         | en_MS  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Nicaragua          | es_NI  | es.json    | true   | ,                 | .                | USD             |
      | LAC    | Nicaragua          | en_NI  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Panama             | es_PA  | es.json    | true   | ,                 | .                | USD             |
      | LAC    | Panama             | en_PA  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Paraguay           | es_PY  | es.json    | true   | ,                 | .                | USD             |
      | LAC    | Paraguay           | en_PY  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Peru               | es_PE  | es.json    | true   | ,                 | .                | USD             |
      | LAC    | Peru               | en_PE  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Puerto Rico        | es_PR  | es.json    | true   | ,                 | .                | USD             |
      | LAC    | Puerto Rico        | en_PR  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Saint Martin       | en_MF  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Sint Maarten       | en_SX  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | St. Kitts & Nevis  | en_KN  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | St. Lucia          | en_LC  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | St. Vincent        | en_VC  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Suriname           | en_SR  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Trinidad & Tobago  | en_TT  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Turks & Caicos     | en_TC  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Uruguay            | es_UY  | es.json    | true   | ,                 | .                | USD             |
      | LAC    | Uruguay            | en_UY  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | US Virgin Islands  | en_VI  | en.json    | true   | ,                 | .                | USD             |
      | LAC    | Venezuela          | es_VE  | es.json    | true   | ,                 | .                | USD             |
      | LAC    | Venezuela          | en_VE  | en.json    | true   | ,                 | .                | USD             |
#      | MEISA  | Afghanistan       |  en_AF  |en.json| false  |,|.|USD|
#      | MEISA  | Algeria           |  en_DZ  |en.json| false  |,|.|USD|
#      | MEISA  | Angola            |  en_AO  |en.json| false  |,|.|USD|
#      | MEISA  | Bahrain           |  en_BH  |en.json| false  |,|.|USD|
#      | MEISA  | Bangladesh        |  en_BD  |en.json| false  |,|.|USD|
#      | MEISA  | Benin             |  en_BJ  |en.json| false  |,|.|USD|
#      | MEISA  | Bhutan            |  en_BT  |en.json| false  |,|.|USD|
#      | MEISA  | Botswana          |  en_BW  |en.json| false  |,|.|USD|
#      | MEISA  | Burkina Faso      |  en_BF  |en.json| false  |,|.|USD|
#      | MEISA  | Burundi           |  en_BI  |en.json| false  |,|.|USD|
#      | MEISA  | Cameroon          |  en_CM  |en.json| false  |,|.|USD|
#      | MEISA  | Cape Verde        |  en_CV  |en.json| false  |,|.|USD|
#      | MEISA  | Chad              |  en_TD  |en.json| false  |,|.|USD|
#      | MEISA  | Congo             |  en_CG  |en.json| false  |,|.|USD|
#      | MEISA  | Congo, Dem.       |  en_CD  |en.json| false  |,|.|USD|
#      | MEISA  | Djibouti          |  en_DJ  |en.json| false  |,|.|USD|
#      | MEISA  | Egypt             |  en_EG  |en.json| false  |,|.|USD|
#      | MEISA  | Eritrea           |  en_ER  |en.json| false  |,|.|USD|
#      | MEISA  | Ethiopia          |  en_ET  |en.json| false  |,|.|USD|
#      | MEISA  | Gabon             |  en_GA  |en.json| false  |,|.|USD|
#      | MEISA  | Gambia            |  en_GM  |en.json| false  |,|.|USD|
#      | MEISA  | Ghana             |  en_GH  |en.json| false  |,|.|USD|
#      | MEISA  | Guinea            |  en_GN  |en.json| false  |,|.|USD|
      | MEISA  | India              | en_IN  | en.json    | true   | ,                 | .                | USD             |
#      | MEISA  | Iraq              |  en_IQ  |en.json| false  |,|.|USD|
#      | MEISA  | Ivory Coast       |  en_CI  |en.json| false  |,|.|USD|
#      | MEISA  | Jordan            |  en_JO  |en.json| false  |,|.|USD|
#      | MEISA  | Kazakhstan        |  en_KZ  |en.json| false  |,|.|USD|
#      | MEISA  | Kenya             |  en_KE  |en.json| false  |,|.|USD|
#      | MEISA  | Kuwait            |  en_KW  |en.json| false  |,|.|USD|
#      | MEISA  | Kyrgyzstan        |  en_KG  |en.json| false  |,|.|USD|
#      | MEISA  | Lebanon           |  en_LB  |en.json| false  |,|.|USD|
#      | MEISA  | Lesotho           |  en_LS  |en.json| false  |,|.|USD|
#      | MEISA  | Liberia           |  en_LR  |en.json| false  |,|.|USD|
#      | MEISA  | Libya             |  en_LY  |en.json| false  |,|.|USD|
#      | MEISA  | Madagascar        |  en_MG  |en.json| false  |,|.|USD|
#      | MEISA  | Malawi            |  en_MW  |en.json| false  |,|.|USD|
#      | MEISA  | Maldives          |  en_MV  |en.json| false  |,|.|USD|
#      | MEISA  | Mali              |  en_ML  |en.json| false  |,|.|USD|
#      | MEISA  | Mauritania        |  en_MR  |en.json| false  |,|.|USD|
#      | MEISA  | Mauritius         |  en_MU  |en.json| false  |,|.|USD|
#      | MEISA  | Morocco           |  en_MA  |en.json| false  |,|.|USD|
#      | MEISA  | Mozambique        |  en_MZ  |en.json| false  |,|.|USD|
#      | MEISA  | Namibia           |  en_NA  |en.json| false  |,|.|USD|
#      | MEISA  | Nepal             |  en_NP  |en.json| false  |,|.|USD|
#      | MEISA  | Niger             |  en_NE  |en.json| false  |,|.|USD|
#      | MEISA  | Nigeria           |  en_NG  |en.json| false  |,|.|USD|
      | MEISA  | Oman               | en_OM  | en.json    | true   | ,                 | .                | USD             |
#      | MEISA  | Pakistan          |  en_PK  |en.json| false  |,|.|USD|
#      | MEISA  | Qatar             |  en_QA  |en.json| false  |,|.|USD|
#      | MEISA  | Reunion Is.       |  en_RE  |en.json| false  |,|.|USD|
#      | MEISA  | Rwanda            |  en_RW  |en.json| false  |,|.|USD|
#      | MEISA  | Saudi Arabia      |  en_SA  |en.json| false  |,|.|USD|
#      | MEISA  | Senegal           |  en_SN  |en.json| false  |,|.|USD|
#      | MEISA  | Seychelles        |  en_SC  |en.json| false  |,|.|USD|
#      | MEISA  | South Africa      |  en_ZA  |en.json| false  |,|.|USD|
#      | MEISA  | Sri Lanka         |  en_LK  |en.json| false  |,|.|USD|
#      | MEISA  | Swaziland         |  en_SZ  |en.json| false  |,|.|USD|
#      | MEISA  | Tanzania          |  en_TZ  |en.json| false  |,|.|USD|
#      | MEISA  | Togo              |  en_TG  |en.json| false  |,|.|USD|
#      | MEISA  | Tunisia           |  en_TN  |en.json| false  |,|.|USD|
#      | MEISA  | U.A.E.            |  ae_AR  |                                                    | false  |,|.|USD|
#      | MEISA  | U.A.E.            |  en_AE  |en.json| false  |,|.|USD|
#      | MEISA  | Uganda            |  en_UG  |en.json| false  |,|.|USD|
#      | MEISA  | Uzbekistan        |  en_UZ  |en.json| false  |,|.|USD|
#      | MEISA  | Zambia            |  en_ZM  |en.json| false  |,|.|USD|
#      | MEISA  | Zimbabwe          |  en_ZW  |en.json| false  |,|.|USD|
      | US     | U.S.A.             | es_US  | es.json    | true   | ,                 | .                | USD             |
      | US     | U.S.A.             | en_US  | en.json    | true   | ,                 | .                | USD             |

  Scenario Outline: 04 - Verify postal code formatting for: <country> [<region>]
    Given I browse to MAGR application
    When "true" equals "true" I change my locale to "<locale>"
    And I ship from the "Iraq" address in "Iraq"
    Then I see option to reset manual address in "Sender" section
    When I continue to ship using manual address search in "From" section
    And I select "<country>" as "origin" from list of countries
    Then I do not see error message when using a correct postal code "<postalCode>" in From section
    And I see an error message when not using a correct postal code format from "<postalCodeFormats>" in From section
    Examples:
      | locale | postalCode | country       | postalCodeFormats                          |
      | en_AT  | 1010       | Austria       | NNNN                                       |
      | en_AU  | 4613       | Australia     | NNNN                                       |
      | en_BE  | 1000       | Belgium       | NNNN                                       |
      | en_BR  | 13010      | Brazil        | NNNNN,NNNNNNNN                             |
      | en_CA  | A1A1A1     | Canada        | ANANAN                                     |
      | en_CH  | 8000       | Switzerland   | NNNN                                       |
      | en_CN  | 100000     | China         | NNNNNN                                     |
      | en_DE  | 10115      | Germany       | NNNNN                                      |
      | en_DK  | 1800       | Denmark       | NNNN                                       |
      | en_ES  | 03000      | Spain         | NNNNN                                      |
      | en_FI  | 00121      | Finland       | NNNNN                                      |
      | en_FR  | 75008      | France        | NNNNN                                      |
      | en_GB  | WC2N5DU    | Great Britain | ANNAA,ANNNAA,ANANAA,AANNAA,AANANAA,AANNNAA |
      | en_GR  | 10431      | Greece        | NNNNN                                      |
      | en_ID  | 80113      | Indonesia     | NNNNN                                      |
      | en_IN  | 110001     | India         | NNNNNN                                     |
      | en_IT  | 10123      | Italy         | NNNNN                                      |
      | en_JP  | 8760854    | Japan         | NNNNNNN                                    |
      | en_KR  | 41521      | South Korea   | NNNNN                                      |
      | en_LU  | 1018       | Luxembourg    | NNNN                                       |
      | en_MX  | 74325      | Mexico        | NNNNN                                      |
      | en_MY  | 50000      | Malaysia      | NNNNN                                      |
      | nl_NL  | 1000AA     | Netherlands   | NNNN,NNNNAA                                |
      | en_NO  | 0025       | Norway        | NNNN                                       |
      | en_PH  | 2700       | Philippines   | NNNN                                       |
      | en_PR  | 00601      | Puerto Rico   | NNNNN,NNNNNNNNN                            |
      | en_PT  | 3050       | Portugal      | NNNN,NNNNNNN                               |
      | en_RU  | 101000     | Russia        | NNNNNN                                     |
      | en_SE  | 12500      | Sweden        | NNNNN                                      |
      | en_SG  | 247964     | Singapore     | NNNNNN                                     |
      | en_TH  | 10110      | Thailand      | NNNNN                                      |
      | en_US  | 99501      | United States | NNNNN,NNNNNNNNN                            |
