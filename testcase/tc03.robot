*** Settings ***
Resource    ${CURDIR}/../resources/import.robot
*** Test Cases ***
Tc_03    
    [Tags]    tc_03    sub_list
    [Setup]    common_web.Go to web notebookspec
    main_page.Click btn search notebook
    ${data_txt_ui}    ${data_count_ui}    ${sublist}    notebook_search_page.Search notebook and count data    macbook
    [Teardown]    SeleniumLibrary.Close Browser