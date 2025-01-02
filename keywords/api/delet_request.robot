*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot
*** Keywords ***
Test delet request
    RequestsLibrary.Create Session    my_session    https://reqres.in/api/users 