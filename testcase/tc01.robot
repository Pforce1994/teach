*** Settings ***
Resource    ${CURDIR}/../resources/import.robot
*** Variables ***
@{list}
*** Test Cases ***
Tc_01
    [Tags]    tc_01    verify_head_menu
    [Setup]    common_web.Go to web notebookspec
    main_page.Click btn search notebook
    ${data_ui}    notebook_search_page.Verify head menu
    # ${data_test_yaml}    notebook_search_page.Get menu name
    ${status}    BuiltIn.Run Keyword And Return Status    BuiltIn.Should Be Equal    ${menu}    ${data_ui}   
    [Teardown]    SeleniumLibrary.Close Browser
    # log to console    \ndata_yaml =${data_test_yaml}
    # log to console    \ndata_ui =${data_ui}
    # ${lol}    BuiltIn.Get Length    ${data_test_yaml}
    # ${lo}    BuiltIn.Get Length    ${data_ui}
    # Log To Console    ndata_yaml:${lol} ndata_ui:${lo}
    # FOR  ${item}  IN  @{data_ui}
    #     ${in_list1}     BuiltIn.Run Keyword And Return Status  BuiltIn.Should Contain   ${data_test_yaml}  ${item}
    #     Log To Console    ${in_list1}
    #     IF  ${in_list1} == False
    #         Log To Console    ${item}
    #     END
    # END
    
    














# tc_02
#     [Tags]    tc_02    verify_menu
#     ${data_ui}    notebook_search_page.Get text menu level 2    
#     ${status}     BuiltIn.Run Keyword And Return Status      BuiltIn.Should be Equal     ${menu['level_2']}   ${data_ui}   
#     # log to console    ${menu['level_2']}
#     # log to console    \ndata_ui = ${data_ui}
# tc_03
#     [Tags]    tc_03    verify_menu
#     ${data_ui}    notebook_search_page.Get text menu level 3
#     ${status}     BuiltIn.Run Keyword And Return Status    BuiltIn.Should be Equal    ${menu['level_3']}    ${data_ui}
#     # log to console    ${menu['level_3']}
#     # log to console    \ndata_ui = ${data_ui}
# tc_04
#     [Tags]    tc_04    search
#     ${data_total_show}    ${data_result_total}    ${list_name}    notebook_search_page.Get data search notebook
#     ${status}     BuiltIn.Run Keyword And Return Status    BuiltIn.Should be Equal    ${data_total_show}    ${data_result_total}
#     BuiltIn.Set Suite Variable    @{list}    @{list_name}
# tc_05
#     [Tags]    tc_05    log
#     Log To Console    ${list}
#     BuiltIn.Run Keyword If Test Failed    SeleniumLibrary.Capture Page Screenshot