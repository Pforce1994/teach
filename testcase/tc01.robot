*** Settings ***
Resource    ${CURDIR}/../resources/import.robot
*** Variables ***
@{list}
*** Test Cases ***
tc_01
    common_web.Go to web notebookspec
    main_page.Click btn search notebook
    ${data_ui}    notebook_search_page.Get text menu level 1
    ${status}    BuiltIn.Run Keyword And Return Status    BuiltIn.Should be Equal    ${menu['level_1']}    ${data_ui}   
    # log to console    ${menu['level_1']}
    # log to console    \ndata_ui = ${data_ui}
tc_02
    ${data_ui}    notebook_search_page.Get text menu level 2    
    ${status}     BuiltIn.Run Keyword And Return Status      BuiltIn.Should be Equal     ${menu['level_2']}   ${data_ui}   
    # log to console    ${menu['level_2']}
    # log to console    \ndata_ui = ${data_ui}
tc_03
    ${data_ui}    notebook_search_page.Get text menu level 3
    ${status}     BuiltIn.Run Keyword And Return Status    BuiltIn.Should be Equal    ${menu['level_3']}    ${data_ui}
    # log to console    ${menu['level_3']}
    # log to console    \ndata_ui = ${data_ui}
tc_04
    ${data_total_show}    ${data_result_total}    @{list_name}    notebook_search_page.Get data search notebook
    ${status}     BuiltIn.Run Keyword And Return Status    BuiltIn.Should be Equal    ${data_total_show}    ${data_result_total}
    BuiltIn.Set Suite Variable    @{list}    @{list_name}
tc_05
    Log To Console    ${list}
