# language: en

Feature: [data-radar] API queries
  As a data-radar client
  I want to check all queries for this API


  @3.1 @one_element @one_high_school
  Scenario: Obtener información de un instituto
    Given I get the "high_school with name "San Benito"
    Then I check that the response body is
    """
    {"kk1": "kk1"}
    """