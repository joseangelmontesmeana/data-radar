# language: en

Feature: [data-radar] API queries (All infrastructures of a type) - use_cases (3.2 - 3.6 - 3.10 - 3.14 - 3.18 - 3.22 - 3.26)
  As a data-radar client
  I want to check all queries (All infrastructures of a type) for this API


  @id_test @<use_case_ref> @all_infrastructures @all_<infrastructures> @all_<infrastructures>_all_information
  Scenario Outline: <id_test>: I check the query to "get all information from all <infrastructures>" - use_case_ref: <use_case_ref>
    When I get all "<infrastructures>"
    Then I verify that the data response is the content of the file "<file>"

    Examples:
      | id_test | use_case_ref | infrastructures | file                                |
      | DR-64   | 3.2          | high_schools    | all_high_schools_all_fields.json   |
      | DR-65   | 3.6          | libraries       | all_libraries_all_fields.json       |
      | DR-66   | 3.10         | monuments       | all_monuments_all_fields.json       |
      | DR-67   | 3.14         | museums         | all_museums_all_fields.json         |
      | DR-68   | 3.18         | nursery_schools | all_nursery_schools_all_fields.json |
      | DR-69   | 3.22         | schools         | all_schools_all_fields.json         |
      | DR-70   | 3.26         | security_forces | all_security_forces_all_fields.json |


  @id_test @<use_case_ref> @all_infrastructures @all_<infrastructures> @all_<infrastructures>_one_field
  Scenario Outline: <id_test>: I check the query to "get the field (<field>) from all <infrastructures>" - use_case_ref: <use_case_ref>
    When I get the field "<field>" from all "<infrastructures>"
    Then I check that the data response is "<info>"

    Examples:
      | id_test | use_case_ref | infrastructures | field     | info                                                                                                                                                                     |
      | DR-71   | 3.2          | high_schools    | name      | [{"name": "I.E.S. test_qa_001"}, {"name": "I.E.S. test_qa_002"}, {"name": "I.E.S. test_qa_003"}, {"name": "I.E.S. test_qa_004"}]                                         |
      | DR-72   | 3.2          | high_schools    | latitude  | [{"latitude": 43.533349}, {"latitude": 43.532827}, {"latitude": 43.53516}, {"latitude": 43.533349}]                                                                      |
      | DR-73   | 3.2          | high_schools    | longitude | [{"longitude": -5.63369}, {"longitude": -5.670317}, {"longitude": -5.63369}, {"longitude": -5.669581}]                                                                   |
      | DR-74   | 3.2          | high_schools    | phone     | [{"phone": "985000011"}, {"phone": "985000012"}, {"phone": "985000013"}, {"phone": "985000014"}]                                                                         |
      | DR-75   | 3.2          | high_schools    | id        | [{"id": "1"}, {"id": "2"}, {"id": "3"}, {"id": "4"}]                                                                                                                     |
      | DR-76   | 3.6          | libraries       | name      | [{"name": "Biblioteca test_qa_001"}, {"name": "Biblioteca test_qa_002"}, {"name": "Biblioteca test_qa_003"}, {"name": "Biblioteca test_qa_004"}]                         |
      | DR-77   | 3.6          | libraries       | latitude  | [{"latitude": 43.5409683}, {"latitude": 43.539022}, {"latitude": 43.53}, {"latitude": 43.521188}]                                                                        |
      | DR-78   | 3.6          | libraries       | longitude | [{"longitude": -5.661986}, {"longitude": -5.650375}, {"longitude": -5.675}, {"longitude": -5.746938}]                                                                    |
      | DR-79   | 3.6          | libraries       | phone     | [{"phone": "985000021"}, {"phone": "985000022"}, {"phone": "985000023"}, {"phone": "985000024"}]                                                                         |
      | DR-80   | 3.6          | libraries       | id        | [{"id": "1"}, {"id": "2"}, {"id": "3"}, {"id": "4"}]                                                                                                                     |
      | DR-81   | 3.10         | monuments       | name      | [{"name": "Monumento test_qa_001"}, {"name": "Monumento test_qa_002"}, {"name": "Monumento test_qa_003"}, {"name": "Monumento test_qa_004"}]                             |
      | DR-82   | 3.10         | monuments       | latitude  | [{"latitude": 43.5352342}, {"latitude": 43.5480321}, {"latitude": 43.5322015}, {"latitude": 43.5490624}]                                                                 |
      | DR-83   | 3.10         | monuments       | longitude | [{"longitude": -5.6839832}, {"longitude": -5.6386973}, {"longitude": -5.6611195}, {"longitude": -5.6376448}]                                                             |
      | DR-84   | 3.10         | monuments       | phone     | [{"phone": "985000031"}, {"phone": "985000032"}, {"phone": "985000033"}, {"phone": "985000034"}]                                                                         |
      | DR-85   | 3.10         | monuments       | id        | [{"id": "1"}, {"id": "2"}, {"id": "3"}, {"id": "4"}]                                                                                                                     |
      | DR-86   | 3.14         | museums         | name      | [{"name": "Museo test_qa_001"}, {"name": "Museo test_qa_002"}, {"name": "Museo test_qa_003"}, {"name": "Museo test_qa_004"}]                                             |
      | DR-87   | 3.14         | museums         | latitude  | [{"latitude": 43.544187}, {"latitude": 43.5453}, {"latitude": 43.537007}, {"latitude": 43.542526}]                                                                       |
      | DR-88   | 3.14         | museums         | longitude | [{"longitude": -5.663812}, {"longitude": -5.663616}, {"longitude": -5.634747}, {"longitude": -5.676867}]                                                                 |
      | DR-89   | 3.14         | museums         | phone     | [{"phone": "985000041"}, {"phone": "985000042"}, {"phone": "985000043"}, {"phone": "985000044"}]                                                                         |
      | DR-90   | 3.14         | museums         | id        | [{"id": "1"}, {"id": "2"}, {"id": "3"}, {"id": "4"}]                                                                                                                     |
      | DR-91   | 3.18         | nursery_schools | name      | [{"name": "Escuela infantil test_qa_001"}, {"name": "Escuela infantil test_qa_002"}, {"name": "Escuela infantil test_qa_003"}, {"name": "Escuela infantil test_qa_004"}] |
      | DR-92   | 3.18         | nursery_schools | latitude  | [{"latitude": 43.528987}, {"latitude": 43.491355}, {"latitude": 43.512529}, {"latitude": 43.527661}]                                                                     |
      | DR-93   | 3.18         | nursery_schools | longitude | [{"longitude": -5.640641}, {"longitude": -5.652119}, {"longitude": -5.668848}, {"longitude": -5.684005}]                                                                 |
      | DR-94   | 3.18         | nursery_schools | phone     | [{"phone": "985000051"}, {"phone": "985000052"}, {"phone": "985000053"}, {"phone": "985000054"}]                                                                         |
      | DR-95   | 3.18         | nursery_schools | id        | [{"id": "1"}, {"id": "2"}, {"id": "3"}, {"id": "4"}]                                                                                                                     |
      | DR-96   | 3.22         | schools         | name      | [{"name": "Colegio test_qa_001"}, {"name": "Colegio test_qa_002"}, {"name": "Colegio test_qa_003"}, {"name": "Colegio test_qa_004"}]                                     |
      | DR-97   | 3.22         | schools         | latitude  | [{"latitude": 43.528448}, {"latitude": 43.530002}, {"latitude": 43.527188}, {"latitude": 43.520813}]                                                                     |
      | DR-98   | 3.22         | schools         | longitude | [{"longitude": -5.671051}, {"longitude": -5.643543}, {"longitude": -5.654062}, {"longitude": -5.750437}]                                                                 |
      | DR-99   | 3.22         | schools         | phone     | [{"phone": "985000061"}, {"phone": "985000062"}, {"phone": "985000063"}, {"phone": "985000064"}]                                                                         |
      | DR-100  | 3.22         | schools         | id        | [{"id": "1"}, {"id": "2"}, {"id": "3"}, {"id": "4"}]                                                                                                                     |
      | DR-101  | 3.26         | security_forces | name      | [{"name": "Bomberos test_qa_001"}, {"name": "Bomberos test_qa_002"}, {"name": "Guardia Civil test_qa_003"}, {"name": "Guardia Civil test_qa_004"}]                       |
      | DR-102  | 3.26         | security_forces | latitude  | [{"latitude": 43.515687}, {"latitude": 43.535219}, {"latitude": 43.531938}, {"latitude": 43.538331}]                                                                     |
      | DR-103  | 3.26         | security_forces | longitude | [{"longitude": -5.679437}, {"longitude": -5.658845}, {"longitude": -5.650687}, {"longitude": -5.677187}]                                                                 |
      | DR-104  | 3.26         | security_forces | phone     | [{"phone": "985000071"}, {"phone": "985000072"}, {"phone": "985000073"}, {"phone": "985000074"}]                                                                         |
      | DR-105  | 3.26         | security_forces | id        | [{"id": "1"}, {"id": "2"}, {"id": "3"}, {"id": "4"}]                                                                                                                     |


  @id_test @<use_case_ref> @all_infrastructures @all_<infrastructures> @all_<infrastructures>_several_fields
  Scenario Outline: <id_test>: I check the query to "get the fields (<fields>) from all <infrastructures>" - use_case_ref: <use_case_ref>
    When I get the fields "<fields>" from all "<infrastructures>"
    Then I verify that the data response is the content of the file "<file>"  

    Examples:
      | id_test | use_case_ref | infrastructures | fields             | file                                               |
      | DR-106  | 3.2          | high_schools    | name id phone      | all_high_schools_name_id_phone_fields.json        |
      | DR-107  | 3.2          | high_schools    | latitude longitude | all_high_schools_latitude longitude_fields.json   |
      | DR-108  | 3.6          | libraries       | name id phone      | all_libraries_name_id_phone_fields.json            |
      | DR-109  | 3.6          | libraries       | latitude longitude | all_libraries_latitude_longitude_fields.json       |
      | DR-110  | 3.10         | monuments       | name id phone      | all_monuments_name_id_phone_fields.json            |
      | DR-111  | 3.10         | monuments       | latitude longitude | all_monuments_latitude_longitude_fields.json       |
      | DR-112  | 3.14         | museums         | name id phone      | all_museums_name_id_phone_fields.json              |
      | DR-113  | 3.14         | museums         | latitude longitude | all_museums_latitude_longitude_fields.json         |
      | DR-114  | 3.18         | nursery_schools | name id phone      | all_nursery_schools_name_id_phone_fields.json      |
      | DR-115  | 3.18         | nursery_schools | latitude longitude | all_nursery_schools_latitude_longitude_fields.json |
      | DR-116  | 3.22         | schools         | name id phone      | all_schools_name_id_phone_fields.json              |
      | DR-117  | 3.22         | schools         | latitude longitude | all_schools_latitude_longitude_fields.json         |
      | DR-118  | 3.26         | security_forces | name id phone      | all_security_forces_name_id_phone_fields.json      |
      | DR-119  | 3.26         | security_forces | latitude longitude | all_security_forces_latitude_longitude_fields.json |
