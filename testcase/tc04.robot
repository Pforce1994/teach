*** Settings ***
Resource    ${CURDIR}/../resources/import.robot
*** Test Cases ***
Tc_04
    [Tags]    tc_04    Excel
    excel_test.Read Data From Excel     ${test_excel}    frist_connect    Sheet1    ${1}    ${1}
    