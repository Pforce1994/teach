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
    ${status}    BuiltIn.Run Keyword And Return Status    BuiltIn.Should Be Equal    ${menu}    ${data_ui}   
    [Teardown]    SeleniumLibrary.Close Browser



































