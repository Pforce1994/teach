*** Settings ***
Resource    ${CURDIR}/../resources/import.robot


*** Test Cases ***
tc_01
    # @{sublist}    BuiltIn.Create List
    # @{ab}    BuiltIn.Create List    a    b
    # @{cd}    BuiltIn.Create List    c    d
    # @{ef}    BuiltIn.Create List    e    f
    # Collections.Append To List    ${sublist}    ${ab}
    # Collections.Append To List    ${sublist}    ${cd}
    # Collections.Append To List    ${sublist}    ${ef}
    # Log To Console    \n${sublist}
    # ${total_row}    BuiltIn.Get Length    ${sublist}
    # Log To Console    total_row = ${total_row}
    # Log To Console    \n${sublist}[2][0]
    @{data}    BuiltIn.Create List    a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  aa  bb  cc dd ee  ff  gg  hh  ii  jj  kk  ll
    ${total_data}    BuiltIn.Get Length    ${data}
    @{list}    BuiltIn.Create List
    FOR  ${index}  IN RANGE  0  ${total_data}  2
        @{sub}    BuiltIn.Create List
        IF  ${index}%5 == ${0}
            FOR  ${index_add}  IN RANGE  ${index}  ${index}+5
                Collections.Append To List    ${sub}    ${data}[${index_add}]
            END
            Collections.Append To List    ${list}    ${sub}
        END
    END
    # Log To Console    ${data}
    Log To Console    ${list}
    # Log To Console    z = ${data}
    # Log To Console    jj = ${list}[3][3]
    ${total_row}    BuiltIn.Get Length    ${list}
    ${total_column}    BuiltIn.Get Length    ${list}[0]
    Log To Console    total_row = ${total_row}
    Log To Console    total_column = ${total_column}
    FOR  ${index_row}  IN RANGE  0  ${total_row}
        FOR  ${index_column}  IN RANGE  0  ${total_column}
            Log To Console    ${list}[${index_row}][${index_column}]
        END
    END
    # (//ul[@class="search-item-list"]//div[@class="item-detail"])[${index_row}]//li[@class="one-line-ellipsis"][${index_column}]
