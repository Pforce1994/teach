*** Settings ***
Resource    ${CURDIR}/../resources/import.robot
*** Test Cases ***
Tc_07
    [Tags]    Tc07
    put_request.Test put request