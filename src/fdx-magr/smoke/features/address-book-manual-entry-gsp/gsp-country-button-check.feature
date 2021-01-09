@gsp
Feature: Shipping from GSP countries only - show correct button label
  As a user I want to be able to ship from GSP countries
  Where I am provided with GSP specific options

  Background: Open application
    Given I browse to MAGR application

  Scenario Outline: User shipping from gsp country should see show transit times button
    Given I ship from the "<city>" address in "<country>"
    And I ship to the "1181HZ" address in "Netherlands"
    And I am shipping one "Your Packaging" weighing 1 "KG"
    And I should see the "show transit times" button
    Examples:
    |   city    | country   | 
    | 	Kabul	| 	Afghanistan	| 
    | 	Tirana	| 	Albania	| 
    | 	Algiers	| 	Algeria	| 
    | 	Vaimoso	| 	Samoa	| 
    | 	Luanda	| 	Angola	| 
    | 	Sandy Ground	| 	Anguilla	| 
    | 	Swetes	| 	Antigua and Barbuda	| 
    | 	Yerevan	| 	Armenia	| 
    | 	Baku	| 	Azerbaijan	| 
    | 	Dhaka	| 	Bangladesh	| 
    | 	Minsk	| 	Belarus	| 
    | 	Belmopan	| 	Belize	| 
    | 	Porto Novo	| 	Benin	| 
    | 	Thimphu	| 	Bhutan	| 
    | 	Sucre	| 	Bolivia	| 
    | 	Doboj	| 	Bosnia and Herzegovina	| 
    | 	Bandar Seri Begawan	| 	Brunei	| 
    | 	Ouagadougou	| 	Burkina Faso	| 
    | 	Gitega	| 	Burundi	| 
    | 	Phnom Penh	| 	Cambodia	| 
    | 	Yaounde	| 	Cameroon	| 
    | 	Assomada	| 	Cape Verde	| 
    | 	N'Djamena	| 	Chad	| 
    | 	Brazzaville	| 	Congo	| 
    | 	Kindu	| 	Democratic Republic of the Congo	| 
    # | 	Avarua	| 	Cook Islands	| 
    | 	Zagreb	| 	Croatia	| 
    | 	Obock	| 	Djibouti	| 
    # | 	Roseau	| 	Dominica	| 
    | 	Barique	| 	Timor-Leste	| 
    | 	Ecuador Guasmo Central	| 	Ecuador	| 
    | 	San Salvador	| 	El Salvador	| 
    | 	Asmara	| 	Eritrea	| 
    | 	Addis Ababa	| 	Ethiopia	| 
    | 	Tórshavn	| 	Faroe Islands	| 
    | 	Sinnamary	| 	French Guiana	| 
    | 	Papeete	| 	French Polynesia	| 
    | 	Libreville	| 	Gabon	| 
    | 	Kunting	| 	The Gambia	| 
    | 	Tbilisi	| 	Georgia	| 
    | 	Accra	| 	Ghana	| 
    | 	Gibraltar International Airport	| 	Gibraltar	| 
    | 	Conakry	| 	Guinea	| 
    | 	Kokadai, Guyana	| 	Guyana	| 
    | 	Port au Prince	| 	Haiti	| 
    | 	Tegucigalpa	| 	Honduras	| 
    | 	Reykjavik	| 	Iceland	| 
    | 	Baghdad	| 	Iraq	| 
    | 	Bouake	| 	Côte d'Ivoire	| 
    | 	Nur-Sultan	| 	Kazakhstan	| 
    | 	Bishkek	| 	Kyrgyzstan	| 
    | 	Vientiane	| 	Laos	| 
    | 	Beirut	| 	Lebanon	| 
    | 	Maseru	| 	Lesotho	| 
    | 	Flumpa	| 	Liberia	| 
    | 	Tripoli	| 	Libya	| 
    | 	Skopje	| 	Macedonia	| 
    | 	Antananarivo	| 	Madagascar	| 
    | 	Thinadoo	| 	Maldives	| 
    | 	Bamako	| 	Mali	| 
    | 	Valletta	| 	Malta	| 
    # | 	Majuro	| 	Marshall Is.	| 
    | 	Nouakchott	| 	Mauritania	| 
    | 	Port Louis	| 	Mauritius	| 
    # | 	Palikir	| 	Micronesia	| 
    | 	Chisinau	| 	Moldova	| 
    | 	Ulaanbaatar	| 	Mongolia	| 
    | 	Podgorica	| 	Montenegro	| 
    # | 	Plymouth	| 	Montserrat	| 
    | 	Rabat	| 	Morocco	| 
    | 	Maputo	| 	Mozambique	| 
    | 	Kathmandu	| 	Nepal	| 
    | 	Nouméa	| 	New Caledonia	| 
    | 	Managua	| 	Nicaragua	| 
    | 	Niamey	| 	Niger	| 
    | 	Abuja	| 	Nigeria	| 
    | 	Karachi	| 	Pakistan	| 
    # | 	Melekeok	| 	Palau	| 
    # | 	Gaza	| 	Palestine	| 
    | 	Port Moresby	| 	Papua New Guinea	| 
    | 	Asuncion	| 	Paraguay	| 
    | 	Jauja	| 	Peru	| 
    | 	Doha	| 	Qatar	| 
    | 	Trois Bassins	| 	Réunion	| 
    | 	Kigali	| 	Rwanda	| 
    # | 	Capital Hill	| 	Saipan	| 
    | 	Riyadh	| 	Saudi Arabia	| 
    | 	Dakar	| 	Senegal	| 
    | 	Belgrade	| 	Serbia	| 
    | 	Beau Vallon| 	Seychelles	| 
    | 	Colombo	| 	Sri Lanka	| 
    # | 	Gustavia	| 	St. Barthelemy	| 
    | 	Paramaribo	| 	Suriname	| 
    | 	Dodoma	| 	Tanzania	| 
    | 	Lome	| 	Togo	| 
    | 	Nuku'alofa	| 	Tonga	| 
    | 	Tunis	| 	Tunisia	| 
    | 	Kampala	| 	Uganda	| 
    | 	Kiev	| 	Ukraine	| 
    | 	Tashkent	| 	Uzbekistan	| 
    # | 	Port Vila	| 	Vanuatu	| 
    # | 	Matâ'utu	| 	Wallis Futuna	| 
    # | 	Letui	| 	Samoa	| 
    | 	Harare	| 	Zimbabwe	| 
