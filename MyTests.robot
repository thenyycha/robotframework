*** Settings ***
Documentation    This is some basic info about the whole suite
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
Should be able to search for a product
    [Documentation]    This is some basic info about the test
    [Tags]    Smoke
    Open browser    https://amazon.com    chrome
    sleep    3s
    input text    id=twotabsearchtextbox    Ferrari 458
    sleep    3s
    click button    css=#nav-search-submit-button


