# language: en

Feature: [data-radar] API queries (Combined infrastructures) - use_case (3.29)
  As a data-radar client
  I want to check queries (Combined infrastructures) for this API


  @<id_test> @<use_case_ref> @combined_queries
  Scenario Outline: <id_test>: I check the combined query to "get all <infrastructures_1> and all <infrastructures_2>" - use_case_ref: <use_case_ref>
    When I get combined query all "<infrastructures_1>" and all "<infrastructures_2>"
    Then I verify that the response content is the content of the file "<file>"

    Examples:
      | id_test | use_case_ref | infrastructures_1 | infrastructures_2 | file            |
      | DR-239  | 3.29         | high_schools      | libraries         | combined_1.json |
      | DR-240  | 3.29         | libraries         | monuments         | combined_2.json |
      | DR-241  | 3.29         | monuments         | museums           | combined_3.json |
      | DR-242  | 3.29         | museums           | nursery_schools   | combined_4.json |
      | DR-243  | 3.29         | nursery_schools   | schools           | combined_5.json |
      | DR-244  | 3.29         | schools           | security_forces   | combined_6.json |
      | DR-245  | 3.29         | security_forces   | high_schools      | combined_7.json |


  @<id_test> @<use_case_ref> @combined_queries
  Scenario Outline: <id_test>: I check the combined query to "get specific <infrastructure_1> and specific <infrastructure_2>" - use_case_ref: <use_case_ref>
    When I get combined query <infrastructure_1>: "<name_1>" with and specific <infrastructure_2>: "<name_2>"
    Then I verify that the response content is the content of the file "<file>"

    Examples:
      | id_test | use_case_ref | infrastructure_1 | name_1                       | infrastructure_2 | name_2                       | file             |
      | DR-246  | 3.29         | high_school      | I.E.S. test_qa_001           | library          | Biblioteca test_qa_001       | combined_8.json  |
      | DR-247  | 3.29         | library          | Biblioteca test_qa_001       | monument         | Monumento test_qa_004        | combined_9.json  |
      | DR-248  | 3.29         | monument         | Monumento test_qa_004        | museum           | Museo test_qa_002            | combined_10.json |
      | DR-249  | 3.29         | museum           | Museo test_qa_002            | nursery_school   | Escuela infantil test_qa_001 | combined_11.json |
      | DR-250  | 3.29         | nursery_school   | Escuela infantil test_qa_001 | school           | Colegio test_qa_002          | combined_12.json |
      | DR-251  | 3.29         | school           | Colegio test_qa_002          | security_forces  | Bomberos test_qa_002         | combined_13.json |
      | DR-252  | 3.29         | security_forces  | Bomberos test_qa_002         | high_school      | I.E.S. test_qa_001           | combined_14.json |


  @<id_test> @<use_case_ref> @combined_queries
  Scenario Outline: <id_test>: I check the combined query to "get nearby <infrastructures_1> and nearby <infrastructures_2>" - use_case_ref: <use_case_ref>
    When I get combined query <infrastructures_1> in radio "<radio_1>" and <infrastructures_2> in radio "<radio_2>" of (latitude: "43.5409683", longitude: "-5.661986")
    Then I verify that the response content is the content of the file "<file>"

    Examples:
      | id_test | use_case_ref | infrastructures_1 | radio_1 | infrastructures_2 | radio_2 | file             |
      | DR-253  | 3.29         | high_schools      | 2000    | libraries         | 1000    | combined_15.json |
      | DR-254  | 3.29         | libraries         | 1000    | monuments         | 2100    | combined_16.json |
      | DR-255  | 3.29         | monuments         | 2100    | museums           | 1000    | combined_17.json |
      | DR-256  | 3.29         | museums           | 1000    | nursery_schools   | 4000    | combined_18.json |
      | DR-257  | 3.29         | nursery_schools   | 4000    | schools           | 9000    | combined_19.json |
      | DR-258  | 3.29         | schools           | 9000    | security_forces   | 1000    | combined_20.json |
      | DR-259  | 3.29         | security_forces   | 1000    | high_schools      | 2000    | combined_21.json |


  @<id_test> @<use_case_ref> @combined_queries
  Scenario Outline: <id_test>: I check the combined query to "get several <infrastructures_1> and several <infrastructures_2>" - use_case_ref: <use_case_ref>
    When I get combined query <infrastructures_1> with names "<names_1>" and <infrastructures_2> with names "<names_2>"
    Then I verify that the response content is the content of the file "<file>"

    Examples:
      | id_test | use_case_ref | infrastructures_1 | names_1                                       | infrastructures_2 | names_2                                       | file             |
      | DR-260  | 3.29         | high_schools      | I.E.S. test_qa_001---I.E.S. test_qa_003       | libraries         | Biblioteca test_qa_002                        | combined_22.json |
      | DR-261  | 3.29         | libraries         | Biblioteca test_qa_002                        | monuments         | Monumento test_qa_003---Monumento test_qa_004 | combined_23.json |
      | DR-262  | 3.29         | monuments         | Monumento test_qa_003---Monumento test_qa_004 | museums           | Museo test_qa_001---Museo test_qa_002         | combined_24.json |
      | DR-263  | 3.29         | museums           | Museo test_qa_001---Museo test_qa_002         | nursery_schools   | Escuela infantil test_qa_003                  | combined_25.json |
      | DR-264  | 3.29         | nursery_schools   | Escuela infantil test_qa_003                  | schools           | Colegio test_qa_001---Colegio test_qa_003     | combined_26.json |
      | DR-265  | 3.29         | schools           | Colegio test_qa_001---Colegio test_qa_003     | security_forces   | Bomberos test_qa_002                          | combined_27.json |
      | DR-266  | 3.29         | security_forces   | Bomberos test_qa_002                          | high_schools      | I.E.S. test_qa_001---I.E.S. test_qa_003       | combined_28.json |
