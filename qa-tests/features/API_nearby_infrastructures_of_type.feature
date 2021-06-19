# language: en

Feature: [data-radar] API queries (Nearby infrastructures of a type) - use_cases (3.3 - 3.7 - 3.11 - 3.15 - 3.19 - 3.23 - 3.27)
  As a data-radar client
  I want to check all queries (Nearby infrastructures of a type) for this API


  @id_test @<use_case_ref> @nearby_infrastructures @nearby_<infrastructures> @nearby_<infrastructures>_all_information
  Scenario Outline: <id_test>: I check the query to "get all information from nearby <infrastructures>" - use_case_ref: <use_case_ref>
    When I get "<infrastructures>" in radio "<radio>" of (latitude: "<latitude>", longitude: "<longitude>")
    Then I verify that the data response is the content of the file "<file>"

    Examples:
      | id_test | use_case_ref | infrastructures | radio | latitude   | longitude | file                                   |
      | DR-120  | 3.3          | high_schools    | 2000  | 43.5409683 | -5.661986 | nearby_high_schools_all_fields.json   |
      | DR-121  | 3.7          | libraries       | 1000  | 43.5409683 | -5.661986 | nearby_libraries_all_fields.json       |
      | DR-122  | 3.11         | monuments       | 2100  | 43.5409683 | -5.661986 | nearby_monuments_all_fields.json       |
      | DR-123  | 3.15         | museums         | 1000  | 43.5409683 | -5.661986 | nearby_museums_all_fields.json         |
      | DR-124  | 3.19         | nursery_schools | 4000  | 43.5409683 | -5.661986 | nearby_nursery_schools_all_fields.json |
      | DR-125  | 3.23         | schools         | 9000  | 43.5409683 | -5.661986 | nearby_schools_all_fields.json         |
      | DR-126  | 3.27         | security_forces | 1000  | 43.5409683 | -5.661986 | nearby_security_forces_all_fields.json |


  @id_test @<use_case_ref> @nearby_infrastructures @nearby_<infrastructures> @nearby_<infrastructures>_all_information
  Scenario Outline: <id_test>: I check the query to "get all information from nearby <infrastructures> empty" - use_case_ref: <use_case_ref>
    When I get "<infrastructures>" in radio "<radio>" of (latitude: "<latitude>", longitude: "<longitude>")
    Then I check that the data response is "<info>"

    Examples:
      | id_test | use_case_ref | infrastructures | radio | latitude   | longitude | info |
      | DR-127  | 3.3          | high_schools    | 1     | 43.5409692 | -5.671986 | []   |
      | DR-128  | 3.7          | libraries       | 1     | 43.5409692 | -5.671986 | []   |
      | DR-129  | 3.11         | monuments       | 1     | 43.5409692 | -5.671986 | []   |
      | DR-130  | 3.15         | museums         | 1     | 43.5409692 | -5.671986 | []   |
      | DR-131  | 3.19         | nursery_schools | 1     | 43.5409692 | -5.671986 | []   |
      | DR-132  | 3.23         | schools         | 1     | 43.5409692 | -5.671986 | []   |
      | DR-133  | 3.27         | security_forces | 1     | 43.5409692 | -5.671986 | []   |


  @id_test @<use_case_ref> @nearby_infrastructures @nearby_<infrastructures> @nearby_<infrastructures>_one_field
  Scenario Outline: <id_test>: I check the query to "get the field (<field>) from nearby <infrastructures>" - use_case_ref: <use_case_ref>
    When I get the field "<field>" from nearby "<infrastructures>" in radio "<radio>" of (latitude: "43.5409683", longitude: "-5.661986")
    Then I check that the data response is "<info>"

    Examples:
      | id_test | use_case_ref | infrastructures | field     | radio | info                                                                                                                                 |
      | DR-134  | 3.3          | high_schools    | name      | 2000  | [{"name": "I.E.S. test_qa_002"}, {"name": "I.E.S. test_qa_004"}]                                                                     |
      | DR-135  | 3.3          | high_schools    | latitude  | 2000  | [{"latitude": 43.532827}, {"latitude": 43.533349}]                                                                                   |
      | DR-136  | 3.3          | high_schools    | longitude | 2000  | [{"longitude": -5.670317}, {"longitude": -5.669581}]                                                                                 |
      | DR-137  | 3.3          | high_schools    | phone     | 2000  | [{"phone": "985000012"}, {"phone": "985000014"}]                                                                                     |
      | DR-138  | 3.3          | high_schools    | id        | 2000  | [{"id": "2"}, {"id": "4"}]                                                                                                           |
      | DR-139  | 3.7          | libraries       | name      | 1000  | [{"name": "Biblioteca test_qa_001"}, {"name": "Biblioteca test_qa_002"}]                                                             |
      | DR-140  | 3.7          | libraries       | latitude  | 1000  | [{"latitude": 43.5409683}, {"latitude": 43.539022}]                                                                                  |
      | DR-141  | 3.7          | libraries       | longitude | 1000  | [{"longitude": -5.661986}, {"longitude": -5.650375}]                                                                                 |
      | DR-142  | 3.7          | libraries       | phone     | 1000  | [{"phone": "985000021"}, {"phone": "985000022"}]                                                                                     |
      | DR-143  | 3.7          | libraries       | id        | 1000  | [{"id": "1"}, {"id": "2"}]                                                                                                           |
      | DR-144  | 3.11         | monuments       | name      | 2100  | [{"name": "Monumento test_qa_001"}, {"name": "Monumento test_qa_002"}, {"name": "Monumento test_qa_003"}]                            |
      | DR-145  | 3.11         | monuments       | latitude  | 2100  | [{"latitude": 43.5352342}, {"latitude": 43.5480321}, {"latitude": 43.5322015}]                                                       |
      | DR-146  | 3.11         | monuments       | longitude | 2100  | [{"longitude": -5.6839832}, {"longitude": -5.6386973}, {"longitude": -5.6611195}]                                                    |
      | DR-147  | 3.11         | monuments       | phone     | 2100  | [{"phone": "985000031"}, {"phone": "985000032"}, {"phone": "985000033"}]                                                             |
      | DR-148  | 3.11         | monuments       | id        | 2100  | [{"id": "1"}, {"id": "2"}, {"id": "3"}]                                                                                              |
      | DR-149  | 3.15         | museums         | name      | 1000  | [{"name": "Museo test_qa_001"}, {"name": "Museo test_qa_002"}]                                                                       |
      | DR-150  | 3.15         | museums         | latitude  | 1000  | [{"latitude": 43.544187}, {"latitude": 43.5453}]                                                                                     |
      | DR-151  | 3.15         | museums         | longitude | 1000  | [{"longitude": -5.663812}, {"longitude": -5.663616}]                                                                                 |
      | DR-152  | 3.15         | museums         | phone     | 1000  | [{"phone": "985000041"}, {"phone": "985000042"}]                                                                                     |
      | DR-153  | 3.15         | museums         | id        | 1000  | [{"id": "1"}, {"id": "2"}]                                                                                                           |
      | DR-154  | 3.19         | nursery_schools | name      | 4000  | [{"name": "Escuela infantil test_qa_001"}, {"name": "Escuela infantil test_qa_003"}, {"name": "Escuela infantil test_qa_004"}]       |
      | DR-155  | 3.19         | nursery_schools | latitude  | 4000  | [{"latitude": 43.528987}, {"latitude": 43.512529}, {"latitude": 43.527661}]                                                          |
      | DR-156  | 3.19         | nursery_schools | longitude | 4000  | [{"longitude": -5.640641}, {"longitude": -5.668848}, {"longitude": -5.684005}]                                                       |
      | DR-157  | 3.19         | nursery_schools | phone     | 4000  | [{"phone": "985000051"}, {"phone": "985000053"}, {"phone": "985000054"}]                                                             |
      | DR-158  | 3.19         | nursery_schools | id        | 4000  | [{"id": "1"}, {"id": "3"}, {"id": "4"}]                                                                                              |
      | DR-159  | 3.23         | schools         | name      | 9000  | [{"name": "Colegio test_qa_001"}, {"name": "Colegio test_qa_002"}, {"name": "Colegio test_qa_003"}, {"name": "Colegio test_qa_004"}] |
      | DR-160  | 3.23         | schools         | latitude  | 9000  | [{"latitude": 43.528448}, {"latitude": 43.530002}, {"latitude": 43.527188}, {"latitude": 43.520813}]                                 |
      | DR-161  | 3.23         | schools         | longitude | 9000  | [{"longitude": -5.671051}, {"longitude": -5.643543}, {"longitude": -5.654062}, {"longitude": -5.750437}]                             |
      | DR-162  | 3.23         | schools         | phone     | 9000  | [{"phone": "985000061"}, {"phone": "985000062"}, {"phone": "985000063"}, {"phone": "985000064"}]                                     |
      | DR-163  | 3.23         | schools         | id        | 9000  | [{"id": "1"}, {"id": "2"}, {"id": "3"}, {"id": "4"}]                                                                                 |
      | DR-164  | 3.27         | security_forces | name      | 1000  | [{"name": "Bomberos test_qa_002"}]                                                                                                   |
      | DR-165  | 3.27         | security_forces | latitude  | 1000  | [{"latitude": 43.535219}]                                                                                                            |
      | DR-166  | 3.27         | security_forces | longitude | 1000  | [{"longitude": -5.658845}]                                                                                                           |
      | DR-167  | 3.27         | security_forces | phone     | 1000  | [{"phone": "985000072"}]                                                                                                             |
      | DR-168  | 3.27         | security_forces | id        | 1000  | [{"id": "2"}]                                                                                                                        |


  @id_test @<use_case_ref> @nearby_infrastructures @nearby_<infrastructures> @nearby_<infrastructures>_several_fields
  Scenario Outline: <id_test>: I check the query to "get the fields (<fields>) from nearby <infrastructures>" - use_case_ref: <use_case_ref>
    When I get the fields "<fields>" from nearby "<infrastructures>" in radio "<radio>" of (latitude: "43.5409683", longitude: "-5.661986")
    Then I verify that the data response is the content of the file "<file>"

    Examples:
      | id_test | use_case_ref | infrastructures | fields             | radio | file                                                  |
      | DR-169  | 3.3          | high_schools    | name id phone      | 2000  | nearby_high_schools_name_id_phone_fields.json        |
      | DR-170  | 3.3          | high_schools    | latitude longitude | 2000  | nearby_high_schools_latitude longitude_fields.json   |
      | DR-171  | 3.7          | libraries       | name id phone      | 1000  | nearby_libraries_name_id_phone_fields.json            |
      | DR-172  | 3.7          | libraries       | latitude longitude | 1000  | nearby_libraries_latitude_longitude_fields.json       |
      | DR-173  | 3.11         | monuments       | name id phone      | 2100  | nearby_monuments_name_id_phone_fields.json            |
      | DR-174  | 3.11         | monuments       | latitude longitude | 2100  | nearby_monuments_latitude_longitude_fields.json       |
      | DR-175  | 3.15         | museums         | name id phone      | 1000  | nearby_museums_name_id_phone_fields.json              |
      | DR-176  | 3.15         | museums         | latitude longitude | 1000  | nearby_museums_latitude_longitude_fields.json         |
      | DR-177  | 3.19         | nursery_schools | name id phone      | 4000  | nearby_nursery_schools_name_id_phone_fields.json      |
      | DR-178  | 3.19         | nursery_schools | latitude longitude | 4000  | nearby_nursery_schools_latitude_longitude_fields.json |
      | DR-179  | 3.23         | schools         | name id phone      | 9000  | nearby_schools_name_id_phone_fields.json              |
      | DR-180  | 3.23         | schools         | latitude longitude | 9000  | nearby_schools_latitude_longitude_fields.json         |
      | DR-181  | 3.27         | security_forces | name id phone      | 1000  | nearby_security_forces_name_id_phone_fields.json      |
      | DR-182  | 3.27         | security_forces | latitude longitude | 1000  | nearby_security_forces_latitude_longitude_fields.json |
