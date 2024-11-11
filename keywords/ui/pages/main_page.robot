*** Settings ***
Resource    ${CURDIR}/../../../resources/import.robot

*** Keywords ***
Click btn search notebook
    [Arguments]    ${timeout}=${30s_timeout}
    SeleniumLibrary.Wait Until Element Is Visible    ${main_locator['btn_search_notebook']}    timeout=${timeout}
    SeleniumLibrary.Click Element    ${main_locator['btn_search_notebook']}
    ${status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${notebook_search_locator['logo_web']}    timeout=${timeout}
    IF  ${status} == ${False}
        FOR  ${index_retry}  IN RANGE  1  ${retry}+1
            SeleniumLibrary.Click Element    ${main_locator['btn_search_notebook']}
            ${status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${notebook_search_locator['logo_web']}    timeout=${timeout}
            BuiltIn.Exit For Loop If  ${status}
        END
    END