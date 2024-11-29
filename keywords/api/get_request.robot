*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot
*** Keywords ***
Test get request
    RequestsLibrary.Create Session    my_session    https://reqres.in/api/users    
    ${response}    RequestsLibrary.GET On Session    my_session    /1
    Should Be Equal As Strings   ${response.json()}[data][id]   ${1}
    Log To Console    ${response.json()}
    Should Be Equal As Strings  ${response.status_code}  200
    Log To Console    ${response.status_code}
