*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:8000/admin
${BROWSER}        Chrome

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    demo
    Input Password    PassPass1
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Close Browser

InValid Login
    Open Browser To Login Page
    Input Username    demo
    Input Password    invalidpass
    Submit Credentials
    Login Should Have Failed
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Log in | Django site admin

Input Username
    [Arguments]    ${username}
    Input Text    username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Button    Log in

Welcome Page Should Be Open
    Title Should Be    Site administration | Django site admin

Login Should Have Failed

    Title Should Be    Log in | Django site admin
    Element Text Should Be    class:errornote    Please enter the correct username and password for a staff account. Note that both fields may be case-sensitive.