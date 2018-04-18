Feature: Serve coffee
  Coffee should not be served until paid for
  Coffee should not be served until the button has been pressed
  If there is no coffee left then money should be refunded

  Background:
    Given there are 1 coffees left in the machine
    And the following data table
    | id  | name  |
    | 1   | Luke  |
    | 2   | Darth |
    
  @last_chance @coffee
  Scenario: Buy last coffee
    And I have deposited $1
    When I press the coffee button
    Then I should be served a coffee

  @last_chance @coffee
  Scenario Outline: Buy coffee
    Given I have deposited $<money>
    When I press the coffee button
    Then I should be served <served> coffees

  Examples:
    | money | served |
    |  1    |  1     |
    |  2    |  1     |
