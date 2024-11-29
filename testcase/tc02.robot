*** Settings ***
Resource    ${CURDIR}/../resources/import.robot
*** Test Cases ***
Tc_02
    [Tags]    tc_02    search_and_get_name_notebook
    [Setup]    common_web.Go to web notebookspec
    main_page.Click btn search notebook
    ${data_total_show}    ${data_result_total}    ${list_name}    notebook_search_page.Search notebook and count data    macbook
    ${status}     BuiltIn.Run Keyword And Return Status    BuiltIn.Should be Equal    ${data_total_show}    ${data_result_total}
    [Teardown]    SeleniumLibrary.Close Browser