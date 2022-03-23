*** Settings ***
Library    SeleniumLibrary
Resource    ./resources/TodoPage.robot
Variables   ./resources/TestData.py
Test Setup    Open Browser To Page
Test Teardown   Clear All Todos

*** Variables ***
${WEBSITE URL}      https://todomvc.com/examples/react/#/
${WEBSITE TITLE}    React • TodoMVC
${BROWSER}        Headless Chrome

*** Test Cases ***
Create One Todo List item
    [Documentation]    Verify that the user can create a new todo list item successfully
    TodoPage.Add New Todo  ${CreateTodoTitle}

Create Three Todo List items
    [Documentation]    Verify that the user can create multiple todo list item successfully
    TodoPage.Add New Todo  ${CreateMultipleTodosTitle1}
    TodoPage.Add New Todo  ${CreateMultipleTodosTitle2}
    TodoPage.Add New Todo  ${CreateMultipleTodosTitle3}

Mark Todo List Item As Complete
    [Documentation]    Verify that the user can mark a todo list item as complete successfully
    TodoPage.Add New Todo  ${MarkTodoTitle}
    TodoPage.Toggle Todo Complete State  ${MarkTodoTitle}
    TodoPage.Verify Todo Is Complete  ${MarkTodoTitle}
    [Teardown]    Clear Completed Todos And Verify No Todos Exist

Mark Todo List Item As Active
    [Documentation]    Verify that the user can mark a todo list item as active successfully
    TodoPage.Add New Todo  ${MarkTodoTitle2}
    TodoPage.Toggle Todo Complete State  ${MarkTodoTitle2}
    TodoPage.Verify Todo Is Complete  ${MarkTodoTitle2}
    TodoPage.Toggle Todo Complete State  ${MarkTodoTitle2}
    TodoPage.Verify Todo Is Active  ${MarkTodoTitle2}

Mark All Todo List Items As Complete
    [Documentation]    Verify that the user can mark all todo list items as complete successfully
    TodoPage.Add New Todo  ${MarkManyTodosCompleteTitle1}
    TodoPage.Add New Todo  ${MarkManyTodosCompleteTitle2}
    TodoPage.Add New Todo  ${MarkManyTodosCompleteTitle3}
    TodoPage.Toggle Complete State For All Todos
    TodoPage.Verify All Todos Are Complete
    [Teardown]    Clear Completed Todos And Verify No Todos Exist

Mark All Todo List Items As Active
    [Documentation]    Verify that the user can mark all todo list items as active successfully
    TodoPage.Add New Todo  ${MarkManyTodosActiveTitle1}
    TodoPage.Add New Todo  ${MarkManyTodosActiveTitle2}
    TodoPage.Add New Todo  ${MarkManyTodosActiveTitle3}
    TodoPage.Toggle Complete State For All Todos 
    TodoPage.Verify All Todos Are Complete
    TodoPage.Toggle Complete State For All Todos 
    TodoPage.Verify All Todos Are Active

Delete Active Todo List Item
    [Documentation]    Verify that the user can delete an active todo list item successfully
    TodoPage.Add New Todo  ${DeleteTodoTitle1}
    TodoPage.Delete Todo  ${DeleteTodoTitle1}
    TodoPage.Verify Todo Is Not Visible  ${DeleteTodoTitle1}

Delete Completed Todo List Item
    [Documentation]    Verify that the user can delete a completed todo list item successfully
    TodoPage.Add New Todo  ${DeleteTodoTitle2}
    TodoPage.Toggle Todo Complete State  ${DeleteTodoTitle2}
    TodoPage.Verify Todo Is Complete  ${DeleteTodoTitle2}
    TodoPage.Delete Todo  ${DeleteTodoTitle2}
    TodoPage.Verify Todo Is Not Visible  ${DeleteTodoTitle2}

** Keywords **
Open Browser To Page
    Open Browser    ${WEBSITE URL}    ${BROWSER}
    Title Should Be    ${WEBSITE TITLE}
    Wait Until Page Contains Element   ${INPUT TODO}

Clear All Todos
    ${count} =  Get Todo Count
    IF    ${count} > 0
        Toggle Complete State For All Todos
        Clear All Completed Todos
    END
    Verify No Todos Exist

Clear Completed Todos And Verify No Todos Exist
    Clear All Completed Todos
    Verify No Todos Exist