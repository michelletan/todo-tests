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

# Verify States
Verify Todo Is Visible
    [Arguments]    ${title}
    ${element} =    Get Todo Item   ${title}
    Element Should Be Visible   ${element}

Verify Todo Is Not Visible
    [Arguments]    ${title}
    ${element} =    Get Todo Item   ${title}
    Element Should Not Be Visible   ${element}

# Get Elements
Get Todo Item
    [Arguments]    ${title}
    ${element} =    Get WebElement    //div[@class = 'view' and contains(., '${title}')]
    [return]    ${element}

Get Todo Item Checkbox
    [Arguments]    ${title}
    ${element} =    Get WebElement    //div[@class = 'view' and contains(., '${title}')]/input[@class = 'toggle']
    [return]    ${element}

Get Todo Item Delete Button
    [Arguments]    ${title}
    ${element} =    Get WebElement    //div[@class = 'view' and contains(., '${title}')]/button[@class = 'destroy']
    [return]    ${element}