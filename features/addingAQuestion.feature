Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Registering
    Given I am on the home page
    When I click "Add Question"
    Then I visit the "New Question Page"
    And I should see "Please enter question"