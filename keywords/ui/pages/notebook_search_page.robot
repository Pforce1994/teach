*** Settings ***
Resource    ${CURDIR}/../../../resources/import.robot
*** Keywords ***
Get text menu level 1
    SeleniumLibrary.Wait Until Element Is Visible    ${notebook_search_locator['menu_level_1']}    timeout=${5s_timeout}
    ${total_menu_level_1}    SeleniumLibrary.Get Element Count    ${notebook_search_locator['menu_level_1']}
    @{list}    BuiltIn.Create List
    FOR  ${index_menu}  IN RANGE  1  ${total_menu_level_1}+1
        ${locator_menu}    BuiltIn.Catenate    SEPARATOR=    (${notebook_search_locator['menu_level_1']})[${index_menu}]
        ${menu_text}       SeleniumLibrary.Get Text    ${locator_menu}
        Collections.Append To List    ${list}    ${menu_text}
        # Log To Console     ${menu_text}
    END
    [Return]    ${list}
Get text menu level 2
    SeleniumLibrary.Wait Until Element Is Visible        ${notebook_search_locator['menu_level_1']}    timeout=${5s_timeout}
    ${total_menu_level_1}    SeleniumLibrary.Get Element Count     ${notebook_search_locator['menu_level_1']}
    @{list}                  BuiltIn.Create List
    FOR  ${index_menu_1}  IN RANGE    1    ${total_menu_level_1}+1 
        SeleniumLibrary.Mouse Over    (${notebook_search_locator['menu_level_1']})[${index_menu_1}]
        ${locator_menu_1}        BuiltIn.Catenate    SEPARATOR=    (${notebook_search_locator['menu_level_1']})[${index_menu_1}]/ul/li
        ${total_menu_level_2}    SeleniumLibrary.Get Element Count   ${locator_menu_1}
        # Log To Console    ${total_menu_level_2}
            IF    ${index_menu_1} < ${5}
                FOR  ${index_menu_2}  IN RANGE  1   ${total_menu_level_2}+1                 
                    ${locator_menu_2}    BuiltIn.Catenate    SEPARATOR=    (${notebook_search_locator['menu_level_1']})[${index_menu_1}]/ul/li[${index_menu_2}]
                    ${menu_text}         SeleniumLibrary.Get Text      ${locator_menu_2} 
                    Collections.Append To List    ${list}    ${menu_text}
                    # Log To Console    ${menu_text}
                END
            ELSE IF   ${index_menu_1} == ${5}
                    ${locator_menu_2}        BuiltIn.Catenate    SEPARATOR=    (${notebook_search_locator['menu_level_1']})[${index_menu_1}]/div/ul/li
                    ${total_menu_level_2}    SeleniumLibrary.Get Element Count   ${locator_menu_2}
                    FOR  ${index_menu_3}  IN RANGE  1    ${total_menu_level_2}+1
                        ${locator_menu_2}    BuiltIn.Catenate    SEPARATOR=    (${notebook_search_locator['menu_level_1']})[${index_menu_1}]/div/ul/li[${index_menu_3}]
                        ${menu_text}         SeleniumLibrary.Get Text      ${locator_menu_2} 
                        Collections.Append To List    ${list}    ${menu_text}
                    END       
                    FOR  ${index_menu_3}  IN RANGE  1    ${total_menu_level_2}+1
                        ${locator_menu_2}    BuiltIn.Catenate    SEPARATOR=    (${notebook_search_locator['menu_level_1']})[${index_menu_1}]/div/ul/li[${index_menu_3}]/a/div/img
                        ${menu_img}         SeleniumLibrary.Get Element Attribute      ${locator_menu_2}    src
                        Collections.Append To List    ${list}    ${menu_img}
                        # Log To Console    ${menu_img}
                    END                                     
            ELSE IF  ${index_menu_1} == ${6}
                ${locator_menu_2}    BuiltIn.Catenate    SEPARATOR=    (${notebook_search_locator['menu_level_1']})[${index_menu_1}]/a
                ${menu_links}         SeleniumLibrary.Get Element Attribute        ${locator_menu_2}    href
                Collections.Append To List    ${list}    ${menu_links}
                # Log To Console    ${menu_links}    
                
            END               
    END        
    [Return]    ${list}
Get text menu level 3
    SeleniumLibrary.Wait Until Element Is Visible    ${notebook_search_locator['menu_level_1']}    timeout=${5s_timeout}
    ${total_menu_level_1}    SeleniumLibrary.Get Element Count     ${notebook_search_locator['menu_level_1']}
    @{list}                  BuiltIn.Create List
    FOR  ${index_menu_1}  IN RANGE    1    ${total_menu_level_1}+1 
        SeleniumLibrary.Mouse Over    (${notebook_search_locator['menu_level_1']})[${index_menu_1}]
        ${locator_menu_1}        BuiltIn.Catenate    SEPARATOR=    (${notebook_search_locator['menu_level_1']})[${index_menu_1}]/ul/li
        ${total_menu_level_2}    SeleniumLibrary.Get Element Count   ${locator_menu_1}    
        FOR  ${index_menu_2}  IN RANGE  1   ${total_menu_level_2}+1 
            SeleniumLibrary.Wait Until Element Is Visible    ${notebook_search_locator['menu_level_1']}    timeout=${5s_timeout}
            ${locator_menu_2}    BuiltIn.Catenate    SEPARATOR=    (${notebook_search_locator['menu_level_1']})[${index_menu_1}]/ul/li[${index_menu_2}]
            SeleniumLibrary.Mouse Over     ${locator_menu_2}
            ${locator_menu_2}    BuiltIn.Catenate    SEPARATOR=    (${notebook_search_locator['menu_level_1']})[${index_menu_1}]/ul/li[${index_menu_2}]/ul/li
            ${total_menu_level_3}    SeleniumLibrary.Get Element Count   ${locator_menu_2}
            # Log To Console    ${total_menu_level_3}
            IF  ${total_menu_level_3} != 0
                # Log To Console    ${total_menu_level_3}
                FOR  ${index_menu_3}  IN RANGE  1    ${total_menu_level_3}+1
                    SeleniumLibrary.Wait Until Element Is Visible    ${notebook_search_locator['menu_level_1']}    timeout=${5s_timeout}
                    ${locator_menu_3}    BuiltIn.Catenate    SEPARATOR=    (${notebook_search_locator['menu_level_1']})[${index_menu_1}]/ul/li[${index_menu_2}]/ul/li[${index_menu_3}]
                    ${menu_text}    SeleniumLibrary.Get Text   ${locator_menu_3}
                    Collections.Append To List    ${list}    ${menu_text}
                    # Log To Console    ${menu_text}
                END
            END                   
        END
    END    
    [Return]    ${list}
Get data search notebook
    SeleniumLibrary.Wait Until Element Is Visible    ${notebook_search_locator['count_notebook']}    timeout=${10s_timeout}
    common_web.Input text    ${notebook_search_locator['input_search_notebook']}        macbook
    SeleniumLibrary.Wait Until Element Contains    ${notebook_search_locator['name_notebook']}    MacBook    timeout=${10s_timeout}
    ${text_result}    SeleniumLibrary.Get Text    ${notebook_search_locator['result_total']}
    # Log To Console    ${text_result}
    ${total_page}    SeleniumLibrary.Get Element Count    ${notebook_search_locator['page_total']}
    # Log To Console    ${total_page}
    #var
    ${rusult_total_notebook}    BuiltIn.Set Variable    ${0}
    @{list_name}    BuiltIn.Create List
    #นับจำนวน notebook ที่ search
    FOR  ${index_page}  IN RANGE  2   ${total_page}
        SeleniumLibrary.Wait Until Element Is Visible     ${notebook_search_locator['count_notebook']}    timeout=${10s_timeout}
        SeleniumLibrary.Scroll Element Into View    ${notebook_search_locator['target_click_page']}
        ${locator_page}    BuiltIn.Catenate    SEPARATOR=    (${notebook_search_locator['page_total']})[${index_page}]        
        SeleniumLibrary.Click Element        ${locator_page}   
        SeleniumLibrary.Wait Until Element Is Visible     ${notebook_search_locator['count_notebook']}    timeout=${10s_timeout}        
        SeleniumLibrary.Scroll Element Into View    ${notebook_search_locator['menu_level_1']}
        ${rusult_notebook}    SeleniumLibrary.Get Element Count    ${notebook_search_locator['count_notebook']}
        ${rusult_total_notebook}    BuiltIn.Evaluate    ${rusult_total_notebook}+${rusult_notebook}
        #จบ การนับจำนวน notebook ที่ search
        #name section
        FOR  ${index_name}  IN RANGE  1    ${rusult_notebook}+1
                # Log To Console    ${index_name}
            SeleniumLibrary.Wait Until Element Is Visible        ${notebook_search_locator['get_name_notebook']}    timeout=${10s_timeout}
            ${locator_name}    BuiltIn.Catenate    SEPARATOR=        (${notebook_search_locator['get_name_notebook']})[${index_name}]
            ...    ${notebook_search_locator['tail_section']}
                # Log To Console    ${locator_name}
            ${name_notebook}    SeleniumLibrary.Get Text    ${locator_name}
                # Log To Console    ${name_notebook}
            Collections.Append To List    ${list_name}    ${name_notebook}            
        END
        #End name section
        # Log To Console    ${index_page}
        # Log To Console    ${rusult_notebook} 
        # Log To Console    ${rusult_total_notebook}   
        # Log To Console    ${list_name}
    END
    @{list}   BuiltIn.Create List
    @{list}    String.Split String    ${text_result} 
    ${get_total_show}    BuiltIn.Set Variable    ${0}
    FOR  ${index}  IN  @{list}
        ${status}    BuiltIn.Run Keyword And Return Status    BuiltIn.Convert To Integer    ${index}
        IF  ${status}
            ${get_total_show}    BuiltIn.Evaluate    ${get_total_show}+${index}
            # Log To Console    ${index}
        END
    END
    [Return]    ${get_total_show}    ${rusult_total_notebook}    @{list_name} 
# Get name notebook
#     [Arguments]    ${total_page}
#     SeleniumLibrary.Wait Until Element Is Visible    ${notebook_search_locator['count_notebook']}    timeout=${10s_timeout}
#     Log To Console    hello:${total_page}

        
    
    
        



    
