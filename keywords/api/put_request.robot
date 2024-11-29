*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot
*** Keywords ***
Test put request
    ${url}    BuiltIn.Set Variable   https://reqres.in/api/users