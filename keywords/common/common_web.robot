*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot

*** Keywords ***
Input text
    [Arguments]    ${locator}    ${text}    ${timeout}=${30s_timeout}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    SeleniumLibrary.Input Text    ${locator}    ${text}

Go to web notebookspec
    Open browser    ${url}     browser=chrome
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Wait Until Element Is Visible    ${main_locator['btn_search_notebook']}    timeout=${30s_timeout}
