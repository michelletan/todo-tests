# Todo MVC Tests

**Test Application:** [Todo MVC](https://todomvc.com/examples/react/#/)

**Objective:** Design automated test cases for the following user stories using Robot Framework:

### User Story 1
As a todo list user, I want to create a new todo list.
I should be able to mark the todo list as completed.
Then I should be able to delete the todo list.

Notes: Automate user actions and make sure the end result of each user action is verified automatically.

### User Story 2
As an automation tester, I want to test the performance of the todo list.
I need to create 20 todo lists with every test run.
Then perform test cleanup by deleting the 20 todo lists before exitting the test run.

Notes: Use TestSetup and TestTearDown in the test scripts.

## Test Cases
1. Create a new todo list item
    1. On the All tab, verify that the item does not have a green tick
    2. On the Active tab, verify that the item is visible
    3. On the Completed tab, verify that the item is not visible
    4. Verify that the item count is correct

2. Create 5 todo list items
    1. On the All tab, verify that the items do not have green ticks
    2. On the Active tab, verify that the items are visible
    3. On the Completed tab, verify that the items are not visible
    4. Verify that the item count is correct

3. Mark a todo list item as complete
    1. On the All tab, verify that the item has a green tick and the text is struck out
    2. On the Active tab, verify that the item is not visible
    3. On the Completed tab, verify that the item is visible
    4. Verify that the item count is updated
    5. Verify that the "Clear completed" button is visible

4. Mark a todo list item as incomplete
    1. On the All tab, verify that the item does not have a green tick and the text is not struck out
    2. On the Active tab, verify that the item is visible
    3. On the Completed tab, verify that the item is not visible
    4. Verify that the item count is updated
    5. Verify that the "Clear completed" button is not visible

5. Mark all todo list items as complete
    1. Verify that all todo list items are complete
    2. Verify that the item count is correct
    3. Verify that the "Clear completed" button is visible

6. Mark all todo list items as incomplete
    1. Verify that all todo list items are incomplete
    2. Verify that the item count is correct
    3. Verify that the "Clear completed" button is not visible

7. Delete an active todo list item
    1. On the All tab, verify that the item is not visible
    2. On the Active tab, verify that the item is not visible
    3. On the Completed tab, verify that the item is not visible

8. Delete a completed todo list item
    1. On the All tab, verify that the item is not visible
    2. On the Active tab, verify that the item is not visible
    3. On the Completed tab, verify that the item is not visible
    
9. Performance Test - Create 20 todo list items