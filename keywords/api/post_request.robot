*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot
*** Keywords ***
Test post request
    ${my_session}    BuiltIn.Set Variable   https://reqres.in/api/users
    &{payload}      BuiltIn.Create Dictionary    username= admin    password= password123
    ${response}    RequestsLibrary.POST     ${my_session}    ${payload}   
    Should Be Equal As Strings  ${response.status_code}  201
    Log To Console    ${response.status_code}   
    Log To Console    ${response.json()}