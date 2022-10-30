*** Settings ***
Documentation    This is some basic info about the test
Library    SeleniumLibrary 

*** Variables ***
${url}    http://the-internet.herokuapp.com/login
${title_login}    The Internet
${btn_login}    class:radius 
${login_success}    //div[@id="flash"]
${btn_logout}    xpath: //*[contains(text(), "Logout")]
${logout_success}    //div[@id="flash"]

*** Test Cases ***
Should be able to log-in successfully
    [Documentation]    Test login with correct username and password and logout 
    [Tags]    Success
    Open browser    ${url}      chrome
    Verify login page    ${title_login} 
    sleep    3s
    input text    id=username    tomsmith
    input text    id=password    SuperSecretPassword! 
    sleep    3s
    Click Button    ${btn_login}
    Verify Login Success    ${login_success}
    sleep    3s
    Click Element    ${btn_logout}
    Verify Logout Success    ${logout_success}


Login fail - Password incorrect 
    [Documentation]    Test login with incorrect password 
    [Tags]    Failed
    Open browser    ${url}      chrome
    Verify login page    ${title_login} 
    sleep    3s
    input text    id=username    tomsmith
    input text    id=password    Password! 
    sleep    3s
    Click Button    ${btn_login}
    Wait Until Element Is Visible    class:flash.flash.error

Login fail - Username not found 
    [Documentation]    Test login with invalid username 
    [Tags]    Notfound
    Open browser    ${url}      chrome
    Verify login page    ${title_login} 
    sleep    3s
    input text    id=username    tomholland
    input text    id=password    Password! 
    sleep    3s
    Click Button    ${btn_login}
    Wait Until Element Is Visible    class:flash.error

*** Keywords ***
Verify login page
    [Arguments]                ${title}
    Title Should Be            ${title}

Verify Login Success
    [Arguments]        ${xpath}
   Element Should Be Visible        ${xpath}

Verify Logout Success
    [Arguments]        ${xpath}
   Element Should Be Visible        ${xpath}