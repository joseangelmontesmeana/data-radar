# language: en

Feature: [data-radar] API queries (To a specific infrastructure) - use_cases (3.1 - 3.5 - 3.9 - 3.13 - 3.17 - 3.21 - 3.25)
  As a data-radar client
  I want to check all queries (To a specific infrastructure) for this API


  @<id_test> @<use_case_ref> @specific_infrastructure @specific_<infrastructure> @specific_<infrastructure>_all_information
  Scenario Outline: <id_test>: I check the query to "get all information from a specific <infrastructure>" - use_case_ref: <use_case_ref>
    When I get the "<infrastructure>" with name "<name>"
    Then I check that the data response is "<info>"

    Examples:
      | id_test | use_case_ref | infrastructure  | name                         | info                                                                                                                     |
      | DR-1    | 3.1          | high_school     | I.E.S. test_qa_001           | {"name": "I.E.S. test_qa_001", "latitude": 43.533349, "longitude": -5.63369, "phone": "985000011", "id": "1"}            |
      | DR-2    | 3.5          | library         | Biblioteca test_qa_001       | {"name": "Biblioteca test_qa_001", "latitude": 43.5409683, "longitude": -5.661986, "phone": "985000021", "id": "1"}      |
      | DR-3    | 3.9          | monument        | Monumento test_qa_001        | {"name": "Monumento test_qa_001", "latitude": 43.5352342, "longitude": -5.6839832, "phone": "985000031", "id": "1"}      |
      | DR-4    | 3.13         | museum          | Museo test_qa_001            | {"name": "Museo test_qa_001", "latitude": 43.544187, "longitude": -5.663812, "phone": "985000041", "id": "1"}            |
      | DR-5    | 3.17         | nursery_school  | Escuela infantil test_qa_001 | {"name": "Escuela infantil test_qa_001", "latitude": 43.528987, "longitude": -5.640641, "phone": "985000051", "id": "1"} |
      | DR-6    | 3.21         | school          | Colegio test_qa_001          | {"name": "Colegio test_qa_001", "latitude": 43.528448, "longitude": -5.671051, "phone": "985000061", "id": "1"}          |
      | DR-7    | 3.25         | security_forces | Bomberos test_qa_001         | {"name": "Bomberos test_qa_001", "latitude": 43.515687, "longitude": -5.679437, "phone": "985000071", "id": "1"}         |


  @<id_test> @<use_case_ref> @specific_infrastructure @specific_<infrastructure> @specific_<infrastructure>_does_not_exist
  Scenario Outline: <id_test>: I check the query to "get the information of a specific <infrastructure> that does not exist" - use_case_ref: <use_case_ref>
    When I get the "<infrastructure>" with name "<name>"
    Then I check that the response body contains error with message "<error_message>"
    And I check that the data response is "<info>"

    Examples:
      | id_test | use_case_ref | infrastructure  | name                            | error_message                                | info |
      | DR-8    | 3.1          | high_school     | I.E.S. test_not_exist           | HighSchool matching query does not exist.    | null |
      | DR-9    | 3.5          | library         | Biblioteca test_not_exist       | Library matching query does not exist.       | null |
      | DR-10   | 3.9          | monument        | Monumento test_not_exist        | Monument matching query does not exist.      | null |
      | DR-11   | 3.13         | museum          | Museo test__not_exist           | Museum matching query does not exist.        | null |
      | DR-12   | 3.17         | nursery_school  | Escuela infantil test_not_exist | NurserySchool matching query does not exist. | null |
      | DR-13   | 3.21         | school          | Colegio test_not_exist          | School matching query does not exist.        | null |
      | DR-14   | 3.25         | security_forces | Bomberos test_not_exist         | SecurityForce matching query does not exist. | null |


  @<id_test> @<use_case_ref> @specific_infrastructure @specific_<infrastructure> @specific_<infrastructure>_one_field
  Scenario Outline: <id_test>: I check the query to "get the field (<field>) from a specific <infrastructure>" - use_case_ref: <use_case_ref>
    When I get the field "<field>" from a "<infrastructure>" with name "<name>"
    Then I check that the data response is "<info>"

    Examples:
     | id_test | use_case_ref | infrastructure  | name                         | field     | info                                     |
     | DR-15   | 3.1          | high_school     | I.E.S. test_qa_001           | name      | {"name": "I.E.S. test_qa_001"}           |
     | DR-16   | 3.1          | high_school     | I.E.S. test_qa_001           | latitude  | {"latitude": 43.533349}                  |
     | DR-17   | 3.1          | high_school     | I.E.S. test_qa_001           | longitude | {"longitude": -5.63369}                  |
     | DR-18   | 3.1          | high_school     | I.E.S. test_qa_001           | phone     | {"phone": "985000011"}                   |
     | DR-19   | 3.1          | high_school     | I.E.S. test_qa_001           | id        | {"id": "1"}                              |
     | DR-20   | 3.5          | library         | Biblioteca test_qa_001       | name      | {"name": "Biblioteca test_qa_001"}       |
     | DR-21   | 3.5          | library         | Biblioteca test_qa_001       | latitude  | {"latitude": 43.5409683}                 |
     | DR-22   | 3.5          | library         | Biblioteca test_qa_001       | longitude | {"longitude": -5.661986}                 |
     | DR-23   | 3.5          | library         | Biblioteca test_qa_001       | phone     | {"phone": "985000021"}                   |
     | DR-24   | 3.5          | library         | Biblioteca test_qa_001       | id        | {"id": "1"}                              |
     | DR-25   | 3.9          | monument        | Monumento test_qa_001        | name      | {"name": "Monumento test_qa_001"}        |
     | DR-26   | 3.9          | monument        | Monumento test_qa_001        | latitude  | {"latitude": 43.5352342}                 |
     | DR-27   | 3.9          | monument        | Monumento test_qa_001        | longitude | {"longitude": -5.6839832}                |
     | DR-28   | 3.9          | monument        | Monumento test_qa_001        | phone     | {"phone": "985000031"}                   |
     | DR-29   | 3.9          | monument        | Monumento test_qa_001        | id        | {"id": "1"}                              |
     | DR-30   | 3.13         | museum          | Museo test_qa_001            | name      | {"name": "Museo test_qa_001"}            |
     | DR-31   | 3.13         | museum          | Museo test_qa_001            | latitude  | {"latitude": 43.544187}                  |
     | DR-32   | 3.13         | museum          | Museo test_qa_001            | longitude | {"longitude": -5.663812}                 |
     | DR-33   | 3.13         | museum          | Museo test_qa_001            | phone     | {"phone": "985000041"}                   |
     | DR-34   | 3.13         | museum          | Museo test_qa_001            | id        | {"id": "1"}                              |
     | DR-35   | 3.17         | nursery_school  | Escuela infantil test_qa_001 | name      | {"name": "Escuela infantil test_qa_001"} |
     | DR-36   | 3.17         | nursery_school  | Escuela infantil test_qa_001 | latitude  | {"latitude": 43.528987}                  |
     | DR-37   | 3.17         | nursery_school  | Escuela infantil test_qa_001 | longitude | {"longitude": -5.640641}                 |
     | DR-38   | 3.17         | nursery_school  | Escuela infantil test_qa_001 | phone     | {"phone": "985000051"}                   |
     | DR-39   | 3.17         | nursery_school  | Escuela infantil test_qa_001 | id        | {"id": "1"}                              |
     | DR-40   | 3.21         | school          | Colegio test_qa_001          | name      | {"name": "Colegio test_qa_001"}          |
     | DR-41   | 3.21         | school          | Colegio test_qa_001          | latitude  | {"latitude": 43.528448}                  |
     | DR-42   | 3.21         | school          | Colegio test_qa_001          | longitude | {"longitude": -5.671051}                 |
     | DR-43   | 3.21         | school          | Colegio test_qa_001          | phone     | {"phone": "985000061"}                   |
     | DR-44   | 3.21         | school          | Colegio test_qa_001          | id        | {"id": "1"}                              |
     | DR-45   | 3.25         | security_forces | Bomberos test_qa_001         | name      | {"name": "Bomberos test_qa_001"}         |
     | DR-46   | 3.25         | security_forces | Bomberos test_qa_001         | latitude  | {"latitude": 43.515687}                  |
     | DR-47   | 3.25         | security_forces | Bomberos test_qa_001         | longitude | {"longitude": -5.679437}                 |
     | DR-48   | 3.25         | security_forces | Bomberos test_qa_001         | phone     | {"phone": "985000071"}                   |
     | DR-49   | 3.25         | security_forces | Bomberos test_qa_001         | id        | {"id": "1"}                              |


  @<id_test> @<use_case_ref> @specific_infrastructure @specific_<infrastructure> @specific_<infrastructure>_several_fields
  Scenario Outline: <id_test>: I check the query to "get the fields (<fields>) from a specific <infrastructure> - use_case_ref: <use_case_ref>
    When I get the fields "<fields>" from a "<infrastructure>" with name "<name>"
    Then I check that the data response is "<info>" 

    Examples:
      | id_test | use_case_ref | infrastructure  | name                         | fields             | info                                                                      |
      | DR-50   | 3.2          | high_school     | I.E.S. test_qa_001           | name id phone      | {"name": "I.E.S. test_qa_001", "id": "1", "phone": "985000011"}           |
      | DR-51   | 3.2          | high_school     | I.E.S. test_qa_001           | latitude longitude | {"latitude": 43.533349, "longitude": -5.63369}                            |
      | DR-52   | 3.6          | library         | Biblioteca test_qa_001       | name id phone      | {"name": "Biblioteca test_qa_001", "id": "1", "phone": "985000021"}       |
      | DR-53   | 3.6          | library         | Biblioteca test_qa_001       | latitude longitude | {"latitude": 43.5409683, "longitude": -5.661986}                          |
      | DR-54   | 3.10         | monument        | Monumento test_qa_001        | name id phone      | {"name": "Monumento test_qa_001", "id": "1", "phone": "985000031"}        |
      | DR-55   | 3.10         | monument        | Monumento test_qa_001        | latitude longitude | {"latitude": 43.5352342, "longitude": -5.6839832}                         |
      | DR-56   | 3.14         | museum          | Museo test_qa_001            | name id phone      | {"name": "Museo test_qa_001", "id": "1", "phone": "985000041"}            |
      | DR-57   | 3.14         | museum          | Museo test_qa_001            | latitude longitude | {"latitude": 43.544187, "longitude": -5.663812}                           |
      | DR-58   | 3.18         | nursery_school  | Escuela infantil test_qa_001 | name id phone      | {"name": "Escuela infantil test_qa_001", "id": "1", "phone": "985000051"} |
      | DR-59   | 3.18         | nursery_school  | Escuela infantil test_qa_001 | latitude longitude | {"latitude": 43.528987, "longitude": -5.640641}                           |
      | DR-60   | 3.22         | school          | Colegio test_qa_001          | name id phone      | {"name": "Colegio test_qa_001", "id": "1", "phone": "985000061"}          |
      | DR-61   | 3.22         | school          | Colegio test_qa_001          | latitude longitude | {"latitude": 43.528448, "longitude": -5.671051}                           |
      | DR-62   | 3.26         | security_forces | Bomberos test_qa_001         | name id phone      | {"name": "Bomberos test_qa_001", "id": "1", "phone": "985000071"}         |
      | DR-63   | 3.26         | security_forces | Bomberos test_qa_001         | latitude longitude | {"latitude": 43.515687, "longitude": -5.679437}                           |
