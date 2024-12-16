*** Settings ***
Resource    ${CURDIR}/../resources/import.robot

*** Variables ***
${total_menu}    6
${total_m1_lv2}    2

*** Test Cases ***
tc_01
    # [Tags]    tc_05
    # # Log To Console    ${menu['level_1']['m2_lv2']['m2_lv3']['n1']}
    # # ${total_menu}    SeleniumLibrary.Get Element Count    xpath มาแปะ
    # FOR  ${index_menu}  IN RANGE  1  ${total_menu}+1
    #     IF  ${index_menu} == ${1}
    #         # ${total_m1_lv2}    SeleniumLibrary.Get Element Count    xpath มาแปะ
    #         FOR  ${index_m1_lv2}  IN RANGE  1  ${total_m1_lv2}+1
    #             Log To Console    ${menu['m${index_menu}_lv2']['n${index_m1_lv2}']}
    #         END
    #     ELSE
    #         Log To Console    ${menu['m${index_menu}']}
    #     END
    # END
    # ${text}    BuiltIn.Set Variable    “อุปกรณ์ IoT” "ภัยเงียบที่เสี่ยงคุกคามบ้านคุณ ?
    # ${text}    String.Remove String    ${text}    "  “  ”  ${SPACE}
    # Log To Console    ${text}
    # @{list}    BuiltIn.Create List    a  b  c  d
    # @{list_g}    BuiltIn.Create List    a  b  r
    # FOR  ${item}  IN  @{list_g}
    #     ${in_list1}     BuiltIn.Run Keyword And Return Status  BuiltIn.Should Contain   ${list}  ${item}
    #     Log To Console    ${in_list1}
    #     IF  ${in_list1} == False
    #         Log To Console    ${item}
    #         Collections.Append To List  ${list}  ${item}
    #     END
    # END
    # Log To Console     The different items are: ${list}

    # FOR  ${item}  IN  @{list}
    #     ${in_list1}     BuiltIn.Run Keyword And Return Status  BuiltIn.Should Contain   ${list_g}  ${item}
    #     Log To Console    ${in_list1}
    #     IF  ${in_list1} == False
    #         Log To Console    ${item}
    #         Collections.Append To List  ${list_g}  ${item}
    #     END
    # END
    # Log To Console     The different items are: ${list_g}
    # ${lol}    BuiltIn.Get Length    ${list}
    # ${lo}    BuiltIn.Get Length    ${list_g}
    # Log To Console    list:${lol} list_g:${lo}

    &{menu}    BuiltIn.Create Dictionary    
    Collections.Set To Dictionary    ${menu}    m1  got   
    &{m1_lv2}    BuiltIn.Create Dictionary
    Collections.Set To Dictionary    ${m1_lv2}    n1  zilla    n2  555   
    Collections.Set To Dictionary    ${menu}     m1_lv2    ${m1_lv2}
    Log To Console   ${menu}
    Log To Console    ${menu['m1']}
    Log To Console    ${menu['m1_lv2']}
    Log To Console    ${menu['m1_lv2']['n1']}

    # FOR  ${index}  IN RANGE  1  6
    #     Open Browser     https://www.google.com/     browser=chrome
    #     SeleniumLibrary.Maximize Browser Window
    # END

