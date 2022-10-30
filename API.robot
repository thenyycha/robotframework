*** Settings ***
Library    RequestsLibrary

*** Variables ***
${URL_GET}    https://reqres.in

*** Test Cases ***
Get user profile success
    Create Session    Get_user_profile    ${URL_GET} 
    ${response}=    GET On Session    Get_user_profile    /api/users/12   
    Log To Console    $(response.status_code)
    Log To Console    $(response.content)


Get user profile but user not found
    Create Session    Get_user_profile    ${URL_GET}
    ${response}=    GET On Session    Get_user_profile    /api/users/1234    expected_status=404
    Should Be Equal As Strings  Not Found  ${response.reason} 

*** Keywords ***
