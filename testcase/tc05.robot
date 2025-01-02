*** Settings ***
Resource    ${CURDIR}/../resources/import.robot
*** Test Cases ***
Tc_05
    [Tags]    Tc05
    get_request.Test get request