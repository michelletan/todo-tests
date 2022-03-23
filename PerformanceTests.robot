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
Create 20 Todo List items
    [Documentation]    Verify that the application can handle creating many todo list items at once
    FOR    ${index}    IN RANGE    20
        ${title} =    Catenate    TODO   ${index}
        TodoPage.Add New Todo  ${title}
    END
    ${count} =    TodoPage.Get Todo Count
    Should Be Equal As Integers    ${count}    20

** Keywords **
Open Browser To Page
    Open Browser    ${WEBSITE URL}    ${BROWSER}
    Title Should Be    ${WEBSITE TITLE}
    Wait Until Page Contains Element   ${INPUT TODO}

Clear All Todos
    ${count} =  TodoPage.Get Todo Count
    IF    ${count} > 0
        TodoPage.Toggle Complete State For All Todos
        TodoPage.Clear All Completed Todos
    END
    TodoPage.Verify No Todos Exist