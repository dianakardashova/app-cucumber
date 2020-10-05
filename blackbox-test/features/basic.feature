Feature: Basic scenarios for application

  Background:
    Given I have a website url http://localhost:4567

  Scenario: Check status "Home page" ---> POSITIVE <---
    Given I have an endpoint /
    When I send request GET to this endpoint
    Then I should receive status code 200

  Scenario: Check status "Error 404 page" ---> POSITIVE <---
    Given I have an endpoint /error404/?
    When I send request GET to this endpoint
    Then I should receive status code 404

  Scenario: Check list of all contacts ---> POSITIVE <---
    Given I have an endpoint /contacts/?
    When I send request GET to this endpoint
    Then I should receive status code 200
    And I should receive body {"0":{"fname":"Kevin","lname":"Borrill","num":"01147589663","addr":"11 Whereever Park Road"},"1":{"fname":"Jimmy","lname":"James","num":"01202927262","addr":"12 North Park Road"}}

  Scenario Outline: Check contact by id ---> POSITIVE <---
    Given I have an endpoint /contacts/<id>/?
    When I send request GET to this endpoint
    Then I should receive status code <code>
    And I should receive body <body>

    Examples:
      | id | code | body |
      | 0  | 200  | {"0":{"fname":"Kevin","lname":"Borrill","num":"01147589663","addr":"11 Whereever Park Road"}} |
      | 1  | 200  | {"1":{"fname":"Jimmy","lname":"James","num":"01202927262","addr":"12 North Park Road"}}       |

  Scenario Outline: Check contact by surname ---> POSITIVE <---
    Given I have an endpoint /contacts/search/<surname>/?
    When I send request GET to this endpoint
    Then I should receive status code <code>
    And I should receive body <body>

    Examples:
      | surname | code | body |
      | Borill  | 200  | {"0":{"fname":"Kevin","lname":"Borrill","num":"01147589663","addr":"11 Whereever Park Road"}} |
      | James   | 200  | {"1":{"fname":"Jimmy","lname":"James","num":"01202927262","addr":"12 North Park Road"}}       |

  Scenario: Check creation of new contact ---> POSITIVE <---
    Given I have an endpoint /contacts/?
    When I send request POST to this endpoint with data:
      | fname | lname | num         | addr            |
      | Kate  | Green | 37775389993 | 10 Central Park |
    Then I should receive status code 201
