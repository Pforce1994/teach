*** Settings ***
Resource    ${CURDIR}/../resources/import.robot

*** Variables ***
${data}    hello
*** Test Cases ***
tc_01
    Log To Console    ${data.capitalize()}