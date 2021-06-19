# language: en

Feature: [data-radar] API queries (Several infrastructures of a type) - use_cases (3.4 - 3.8 - 3.12 - 3.16 - 3.20 - 3.24 - 3.28)
  As a data-radar client
  I want to check all queries (Several infrastructures of a type) for this API


  @<use_case_ref> @several_infrastructures @several_<infrastructures> @several_<infrastructures>_all_information
  Scenario Outline: <id_test>: I check the query to "get all information from several <infrastructures>" - use_case_ref: <use_case_ref>
    When I get the "<infrastructures>" with names "<names>"
    Then I verify that the data response is the content of the file "<file>"

    Examples:
      | id_test | use_case_ref | infrastructures | names                                           | file                                    |
      | DR-183  | 3.4          | high_schools    | I.E.S. test_qa_001---I.E.S. test_qa_003         | several_high_schools_all_fields.json    |
      | DR-184  | 3.8          | libraries       | Biblioteca test_qa_002---Biblioteca test_qa_003 | several_libraries_all_fields.json       |
      | DR-185  | 3.12         | monuments       | Monumento test_qa_003---Monumento test_qa_004   | several_monuments_all_fields.json       |
      | DR-186  | 3.16         | museums         | Museo test_qa_001---Museo test_qa_002           | several_museums_all_fields.json         |
      | DR-187  | 3.20         | nursery_schools | Escuela infantil test_qa_003                    | several_nursery_schools_all_fields.json |
      | DR-188  | 3.24         | schools         | Colegio test_qa_001---Colegio test_qa_003       | several_schools_all_fields.json         |
      | DR-189  | 3.28         | security_forces | Bomberos test_qa_002                            | several_security_forces_all_fields.json |


  @<use_case_ref> @several_infrastructures @several_<infrastructures> @several_<infrastructures>_one_field
  Scenario Outline: <id_test>: I check the query to "get the field (<field>) from several <infrastructures>" - use_case_ref: <use_case_ref>
    When I get the field "<field>" from "<infrastructures>" with names "<names>"
    Then I check that the data response is "<info>"

    Examples:
      | id_test | use_case_ref | infrastructures | names                                           | field     | info                                                                                                                                                                     |
      | DR-190  | 3.4          | high_schools    | I.E.S. test_qa_001---I.E.S. test_qa_003         | name      | [{"name": "I.E.S. test_qa_001"}, {"name": "I.E.S. test_qa_003"}]         |
      | DR-191  | 3.4          | high_schools    | I.E.S. test_qa_001---I.E.S. test_qa_003         | latitude  | [{"latitude": 43.533349}, {"latitude": 43.53516}]                        |
      | DR-192  | 3.4          | high_schools    | I.E.S. test_qa_001---I.E.S. test_qa_003         | longitude | [{"longitude": -5.63369}, {"longitude": -5.63369}]                       |
      | DR-193  | 3.4          | high_schools    | I.E.S. test_qa_001---I.E.S. test_qa_003         | phone     | [{"phone": "985000011"}, {"phone": "985000013"}]                         |
      | DR-194  | 3.4          | high_schools    | I.E.S. test_qa_001---I.E.S. test_qa_003         | id        | [{"id": "1"}, {"id": "3"}]                                               |
      | DR-195  | 3.8          | libraries       | Biblioteca test_qa_002---Biblioteca test_qa_003 | name      | [{"name": "Biblioteca test_qa_002"}, {"name": "Biblioteca test_qa_003"}] |
      | DR-196  | 3.8          | libraries       | Biblioteca test_qa_002---Biblioteca test_qa_003 | latitude  | [{"latitude": 43.539022}, {"latitude": 43.53}]                           |
      | DR-197  | 3.8          | libraries       | Biblioteca test_qa_002---Biblioteca test_qa_003 | longitude | [{"longitude": -5.650375}, {"longitude": -5.675}]                        |
      | DR-198  | 3.8          | libraries       | Biblioteca test_qa_002---Biblioteca test_qa_003 | phone     | [{"phone": "985000022"}, {"phone": "985000023"}]                         |
      | DR-199  | 3.8          | libraries       | Biblioteca test_qa_002---Biblioteca test_qa_003 | id        | [{"id": "2"}, {"id": "3"}]                                               |
      | DR-200  | 3.12         | monuments       | Monumento test_qa_003---Monumento test_qa_004   | name      | [{"name": "Monumento test_qa_003"}, {"name": "Monumento test_qa_004"}]   |
      | DR-201  | 3.12         | monuments       | Monumento test_qa_003---Monumento test_qa_004   | latitude  | [{"latitude": 43.5322015}, {"latitude": 43.5490624}]                     |
      | DR-202  | 3.12         | monuments       | Monumento test_qa_003---Monumento test_qa_004   | longitude | [{"longitude": -5.6611195}, {"longitude": -5.6376448}]                   |
      | DR-203  | 3.12         | monuments       | Monumento test_qa_003---Monumento test_qa_004   | phone     | [{"phone": "985000033"}, {"phone": "985000034"}]                         |
      | DR-204  | 3.12         | monuments       | Monumento test_qa_003---Monumento test_qa_004   | id        | [{"id": "3"}, {"id": "4"}]                                               |
      | DR-205  | 3.16         | museums         | Museo test_qa_001---Museo test_qa_002           | name      | [{"name": "Museo test_qa_001"}, {"name": "Museo test_qa_002"}]           |
      | DR-206  | 3.16         | museums         | Museo test_qa_001---Museo test_qa_002           | latitude  | [{"latitude": 43.544187}, {"latitude": 43.5453}]                         |
      | DR-207  | 3.16         | museums         | Museo test_qa_001---Museo test_qa_002           | longitude | [{"longitude": -5.663812}, {"longitude": -5.663616}]                     |
      | DR-208  | 3.16         | museums         | Museo test_qa_001---Museo test_qa_002           | phone     | [{"phone": "985000041"}, {"phone": "985000042"}]                         |
      | DR-209  | 3.16         | museums         | Museo test_qa_001---Museo test_qa_002           | id        | [{"id": "1"}, {"id": "2"}]                                               |
      | DR-210  | 3.20         | nursery_schools | Escuela infantil test_qa_003                    | name      | [{"name": "Escuela infantil test_qa_003"}]                               |
      | DR-211  | 3.20         | nursery_schools | Escuela infantil test_qa_003                    | latitude  | [{"latitude": 43.512529}]                                                |
      | DR-212  | 3.20         | nursery_schools | Escuela infantil test_qa_003                    | longitude | [{"longitude": -5.668848}]                                               |
      | DR-213  | 3.20         | nursery_schools | Escuela infantil test_qa_003                    | phone     | [ {"phone": "985000053"}]                                                |
      | DR-214  | 3.20         | nursery_schools | Escuela infantil test_qa_003                    | id        | [{"id": "3"}]                                                            |
      | DR-215  | 3.24         | schools         | Colegio test_qa_001---Colegio test_qa_003       | name      | [{"name": "Colegio test_qa_001"}, {"name": "Colegio test_qa_003"}]       |
      | DR-216  | 3.24         | schools         | Colegio test_qa_001---Colegio test_qa_003       | latitude  | [{"latitude": 43.528448}, {"latitude": 43.527188}]                       |
      | DR-217  | 3.24         | schools         | Colegio test_qa_001---Colegio test_qa_003       | longitude | [{"longitude": -5.671051}, {"longitude": -5.654062}]                     |
      | DR-218  | 3.24         | schools         | Colegio test_qa_001---Colegio test_qa_003       | phone     | [{"phone": "985000061"}, {"phone": "985000063"}]                         |
      | DR-219  | 3.24         | schools         | Colegio test_qa_001---Colegio test_qa_003       | id        | [{"id": "1"}, {"id": "3"}]                                               |
      | DR-220  | 3.28         | security_forces | Bomberos test_qa_002                            | name      | [{"name": "Bomberos test_qa_002"}]                                       |
      | DR-221  | 3.28         | security_forces | Bomberos test_qa_002                            | latitude  | [{"latitude": 43.535219}]                                                |
      | DR-222  | 3.28         | security_forces | Bomberos test_qa_002                            | longitude | [{"longitude": -5.658845}]                                               |
      | DR-223  | 3.28         | security_forces | Bomberos test_qa_002                            | phone     | [{"phone": "985000072"}]                                                 |
      | DR-224  | 3.28         | security_forces | Bomberos test_qa_002                            | id        | [{"id": "2"}]                                                            |


  @<use_case_ref> @several_infrastructures @several_<infrastructures> @several_<infrastructures>_several_fields
  Scenario Outline: <id_test>: I check the query to "get the fields (<fields>) from several <infrastructures>" - use_case_ref: <use_case_ref>
    When I get the fields "<fields>" from "<infrastructures>" with names "<names>"
    Then I verify that the data response is the content of the file "<file>"

    Examples:
      | id_test | use_case_ref | infrastructures | names                                           | fields             | file                                                   |
      | DR-225  | 3.4          | high_schools    | I.E.S. test_qa_001---I.E.S. test_qa_003         | name id phone      | several_high_schools_name_id_phone_fields.json         |
      | DR-226  | 3.4          | high_schools    | I.E.S. test_qa_001---I.E.S. test_qa_003         | latitude longitude | several_high_schools_latitude longitude_fields.json    |
      | DR-227  | 3.8          | libraries       | Biblioteca test_qa_002---Biblioteca test_qa_003 | name id phone      | several_libraries_name_id_phone_fields.json            |
      | DR-228  | 3.8          | libraries       | Biblioteca test_qa_002---Biblioteca test_qa_003 | latitude longitude | several_libraries_latitude_longitude_fields.json       |
      | DR-229  | 3.12         | monuments       | Monumento test_qa_003---Monumento test_qa_004   | name id phone      | several_monuments_name_id_phone_fields.json            |
      | DR-230  | 3.12         | monuments       | Monumento test_qa_003---Monumento test_qa_004   | latitude longitude | several_monuments_latitude_longitude_fields.json       |
      | DR-231  | 3.16         | museums         | Museo test_qa_001---Museo test_qa_002           | name id phone      | several_museums_name_id_phone_fields.json              |
      | DR-232  | 3.16         | museums         | Museo test_qa_001---Museo test_qa_002           | latitude longitude | several_museums_latitude_longitude_fields.json         |
      | DR-233  | 3.20         | nursery_schools | Escuela infantil test_qa_003                    | name id phone      | several_nursery_schools_name_id_phone_fields.json      |
      | DR-234  | 3.20         | nursery_schools | Escuela infantil test_qa_003                    | latitude longitude | several_nursery_schools_latitude_longitude_fields.json |
      | DR-235  | 3.24         | schools         | Colegio test_qa_001---Colegio test_qa_003       | name id phone      | several_schools_name_id_phone_fields.json              |
      | DR-236  | 3.24         | schools         | Colegio test_qa_001---Colegio test_qa_003       | latitude longitude | several_schools_latitude_longitude_fields.json         |
      | DR-237  | 3.28         | security_forces | Bomberos test_qa_002                            | name id phone      | several_security_forces_name_id_phone_fields.json      |
      | DR-238  | 3.28         | security_forces | Bomberos test_qa_002                            | latitude longitude | several_security_forces_latitude_longitude_fields.json |
