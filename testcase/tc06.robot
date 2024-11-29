*** Settings ***
Resource    ${CURDIR}/../resources/import.robot
*** Test Cases ***
Tc_06
    [Tags]    Tc05
    post_request.Test post request