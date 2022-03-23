*** Settings ***
Library    SeleniumLibrary
Resource    ./resources/TodoPage.robot
Variables   ./resources/TestData.py
Test Setup    Open Browser To Page

*** Variables ***
${WEBSITE URL}      https://todomvc.com/examples/react/#/
${BROWSER}        Headless Chrome

*** Test Cases ***
Create One Todo List item
    [Documentation]    Verify that the user can create a new todo list item successfully
    TodoPage.Add New Todo  ${CreateTodoTitle}

Create Three Todo List items
    [Documentation]    Verify that the user can create multiple todo list item successfully

Mark Todo List Item As Complete
    [Documentation]    Verify that the user can mark a todo list item as complete successfully
  
Mark Todo List Item As Incomplete
    [Documentation]    Verify that the user can mark a todo list item as incomplete successfully
  
Mark All Todo List Items As Complete
    [Documentation]    Verify that the user can mark all todo list items as complete successfully
  
Mark All Todo List Items As Incomplete
    [Documentation]    Verify that the user can mark all todo list items as incomplete successfully
  
Delete Active Todo List Item
    [Documentation]    Verify that the user can delete an active todo list item successfully
  
Delete Completed Todo List Item
    [Documentation]    Verify that the user can delete a completed todo list item successfully

** Keywords **
Open Browser To Page
    Open Browser    ${WEBSITE URL}    ${BROWSER}
    Title Should Be    React • TodoMVC