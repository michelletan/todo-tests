# This file acts as a PageObject
*** Settings ***
Library  SeleniumLibrary

*** Variables ***
# General Locators
${INPUT TODO}   class:new-todo

*** Keywords ***
# High-level Keywords
Add New Todo
    [Arguments]    ${title}
    Input Text For New Todo  ${title}
    Submit New Todo
    Verify Todo Is Visible  ${title}

# Manipulate Elements
Input Text For New Todo
    [Arguments]    ${text}
    Input Text    ${INPUT TODO}    ${text}

Submit New Todo
    Press Keys    ${InputTodo}    RETURN

Toggle Todo Complete State
    [Arguments]    ${title}
    ${element} =    Get Todo Item Checkbox  ${title}
    Click Element    ${element}

Toggle Complete State For All Todos
    Click Element   //label[@for = 'toggle-all']

Clear All Completed Todos
    Click Element   class:clear-completed

Delete Todo
    [Arguments]    ${title}
    ${item} =    Get Todo Item  ${title}
    Mouse Over    ${item}
    ${button} =    Get Todo Item Delete Button  ${title}
    Click Element    ${button}

# Verify States
Verify Todo Is Visible
    [Arguments]    ${title}
    ${element} =    Get Todo Item   ${title}
    Element Should Be Visible   ${element}

Verify Todo Is Not Visible
    [Arguments]    ${title}
    Page Should Not Contain   //div[@class = 'view' and . = '${title}']

Verify Todo Is Complete
    [Arguments]    ${title}
    ${state} =    Get Todo Complete State   ${title}
    Should Be Equal    ${state}    true

Verify Todo Is Active
    [Arguments]    ${title}
    ${state} =    Get Todo Complete State   ${title}
    Should Be Equal As Strings    ${state}    None

Verify All Todos Are Complete
    ${count} =    Get Element Count     //input[@class = 'toggle' and @checked = true]
    Should Be Equal As Integers     ${count}    0

Verify All Todos Are Active
    ${count} =    Get Element Count     //input[@class = 'toggle' and @checked = false]
    Should Be Equal As Integers     ${count}    0

Verify No Todos Exist
    ${count} =    Get Todo Count
    Should Be Equal As Integers     ${count}    0

# Get Functions
Get Todo Item
    [Arguments]    ${title}
    ${element} =    Get WebElement    //div[@class = 'view' and . = '${title}']
    [return]    ${element}

Get Todo Item Checkbox
    [Arguments]    ${title}
    ${element} =    Get WebElement    //div[@class = 'view' and . = '${title}']/input[@class = 'toggle']
    [return]    ${element}

Get Todo Item Delete Button
    [Arguments]    ${title}
    ${element} =    Get WebElement    //div[@class = 'view' and . = '${title}']/button[@class = 'destroy']
    [return]    ${element}

Get Todo Count
    ${count} =    Get Element Count     class:view
    [return]    ${count}

Get Active Todo Count
    ${count} =    Get Element Count     //div[@class = 'view' and . = '${title}']/input[@class = 'toggle' and checked = false]
    [return]    ${count}

Get Todo Complete State
    [Arguments]    ${title}
    ${element} =    Get Todo Item Checkbox  ${title}
    ${state} =   Get Element Attribute    ${element}    checked
    [return]    ${state}