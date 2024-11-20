*** Settings ***
Resource    ${CURDIR}/../resources/import.robot

*** Variables ***
${data}    โน็ตบุ๊ค 88 รุ่น
*** Test Cases ***
tc_01
    # ${result_total}    test list
    # Log To Console    ${result_total}[1]
    @{list}    test return list
    Log To Console    ${list}



*** Keywords ***
test list
    # Log To Console    ${data}
    ${list}    String.Split String    ${data}    ${SPACE}
    Log To Console    ${list}
    # ${string}    BuiltIn.Catenate    @{list}
    # Log To Console    string = ${string}
    [Return]    ${data}    ${list}[1]

test return list
    @{list}    BuiltIn.Create List    a    b    c
    [Return]    @{list}
