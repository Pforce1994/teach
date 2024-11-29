*** Settings ***
Resource    ${CURDIR}/../../../resources/import.robot
*** Keywords ***

Verify head menu
    SeleniumLibrary.Wait Until Element Is Visible    ${notebook_search_locator['menu_level_1']}    timeout=${10s_timeout}
    ${menu_total_lv1}    SeleniumLibrary.Get Element Count    ${notebook_search_locator['menu_level_1']} 
    @{list}    BuiltIn.Create List
    &{get_menu}    BuiltIn.Create Dictionary    
        FOR  ${index_menu_lv1}  IN RANGE  1    ${menu_total_lv1}+1
            ${menu_lv1}    BuiltIn.Catenate    SEPARATOR=    (${notebook_search_locator['menu_level_1']})[${index_menu_lv1}]
            ${menu_name_lv1}    SeleniumLibrary.Get Text    ${menu_lv1}   
            # Collections.Append To List  ${list}    ${menu_name_lv1}  
            Collections.Set To Dictionary    ${get_menu}    m${index_menu_lv1}    ${menu_name_lv1}        
            SeleniumLibrary.Mouse Over    ${menu_lv1}
            SeleniumLibrary.Wait Until Element Is Visible    ${menu_lv1}    timeout=${10s_timeout}
            IF  ${index_menu_lv1} <= ${4}
                ${menu_lv1}    BuiltIn.Catenate    SEPARATOR=       (${menu_lv1})/ul/li
            ELSE IF    ${index_menu_lv1} == ${5}
                ${menu_lv1}    BuiltIn.Catenate    SEPARATOR=       (${menu_lv1})/div/ul/li
            ELSE IF    ${index_menu_lv1} == ${6}
                ${menu_lv1}    BuiltIn.Catenate    SEPARATOR=       (${menu_lv1})/a
                ${menu_name_link}    SeleniumLibrary.Get Element Attribute    ${menu_lv1}    href
            END            
            ${total_menu_lv2}    SeleniumLibrary.Get Element Count    ${menu_lv1}
            &{m_lv2}    BuiltIn.Create Dictionary 
            FOR  ${index_menu_lv2}  IN RANGE  1    ${total_menu_lv2}+1
                IF  ${index_menu_lv1} <= ${4}
                ${menu_lv2}    BuiltIn.Catenate    SEPARATOR=        (${menu_lv1})[${index_menu_lv2}]
                SeleniumLibrary.Mouse Over    ${menu_lv2}
                SeleniumLibrary.Wait Until Element Is Visible    ${menu_lv2}    timeout=${20s_timeout} 
                ${menu_lv2}    BuiltIn.Catenate    SEPARATOR=    (${menu_lv2})/a
                ${menu_name_lv2}    SeleniumLibrary.Get Text    ${menu_lv2}
                # Collections.Append To List  ${list}    ${menu_name_lv2}
                Collections.Set To Dictionary    ${m_lv2}    n${index_menu_lv2}  ${menu_name_lv2}  
                Collections.Set To Dictionary    ${get_menu}    m${index_menu_lv1}_lv2  ${m_lv2}  
                ${menu_lv2}    BuiltIn.Set Variable    (${menu_lv1})[${index_menu_lv2}]
                ${menu_lv2}    BuiltIn.Catenate    SEPARATOR=    (${menu_lv2})/ul/li
                ${total_menu_lv3}    SeleniumLibrary.Get Element Count    ${menu_lv2}
                &{n_lv3}    BuiltIn.Create Dictionary   
                FOR  ${index_menu_lv3}  IN RANGE  1    ${total_menu_lv3}+1
                    ${menu_lv3}    BuiltIn.Catenate    SEPARATOR=        (${menu_lv2})[${index_menu_lv3}]
                    SeleniumLibrary.Mouse Over    ${menu_lv3}
                    SeleniumLibrary.Wait Until Element Is Visible    ${menu_lv3}    timeout=${20s_timeout}
                    ${menu_name_lv3}    SeleniumLibrary.Get Text    ${menu_lv3}
                    # Collections.Append To List  ${list}    ${menu_name_lv3}
                    Collections.Set To Dictionary    ${n_lv3}    p${index_menu_lv3}  ${menu_name_lv3}
                    Collections.Set To Dictionary    ${m_lv2}    n${index_menu_lv2}_lv3  ${n_lv3}
                END
                ELSE IF  ${index_menu_lv1} == ${5}
                    ${menu_lv2}    BuiltIn.Catenate    SEPARATOR=        (${menu_lv1})[${index_menu_lv2}]/a/div/img
                    SeleniumLibrary.Mouse Over    ${menu_lv2}
                    SeleniumLibrary.Wait Until Element Is Visible    ${menu_lv2}    timeout=${20s_timeout}
                    ${menu_name_lv2_img}    SeleniumLibrary.Get Element Attribute    ${menu_lv2}    src
                    ${menu_lv2}    BuiltIn.Set Variable    (${menu_lv1})[${index_menu_lv2}]/a/p
                    ${menu_name_lv2}    SeleniumLibrary.Get Text    ${menu_lv2}
                    ${menu_name_lv2}    String.Remove String    ${menu_name_lv2}    "  “  ”  ${SPACE}
                    # Collections.Append To List  ${list}    ${menu_name_lv2_img}
                    # Collections.Append To List  ${list}    ${menu_name_lv2} 
                    Collections.Set To Dictionary    ${m_lv2}   n${index_menu_lv2}  ${menu_name_lv2_img}   n${index_menu_lv2}_2  ${menu_name_lv2}
                    Collections.Set To Dictionary    ${get_menu}    m${index_menu_lv1}_lv2  ${m_lv2}
                END
                IF    ${index_menu_lv1} == ${6}
                    # Collections.Append To List  ${list}    ${menu_name_link}
                    Collections.Set To Dictionary    ${m_lv2}    n1  ${menu_name_link}
                    Collections.Set To Dictionary  ${get_menu}    m${index_menu_lv1}_lv2    ${m_lv2}
                END
            END
        END 
        # Log To Console    ${get_menu}
        RETURN    ${get_menu}

# Get menu name   
#     @{list_get}    BuiltIn.Create List
#     ${total_menu}    SeleniumLibrary.Get Element Count    ${notebook_search_locator['menu_level_1']}
#     FOR  ${index_menu}  IN RANGE  1  ${total_menu}+1
#         IF  ${index_menu} <= ${4}
#             # Log To Console    ${menu['m${index_menu}']}
#             # Collections.Append To List    ${list_get}    ${menu['m${index_menu}']}
#             ${menu_lv1}    BuiltIn.Catenate    SEPARATOR=    (${notebook_search_locator['menu_level_1']})[${index_menu}]/ul/li
#             ${total_m1_lv2}    SeleniumLibrary.Get Element Count    ${menu_lv1}
#             FOR  ${index_m1_lv2}  IN RANGE  1  ${total_m1_lv2}+1
#                 ${menu_lv2}    BuiltIn.Catenate    SEPARATOR=    (${menu_lv1})[${index_m1_lv2}]
#                 # Log To Console    ${menu['m${index_menu}_lv2']['n${index_m1_lv2}']}
#                 # Collections.Append To List    ${list_get}    ${menu['m${index_menu}_lv2']['n${index_m1_lv2}']}
#                 ${menu_lv2}    BuiltIn.Catenate    SEPARATOR=    (${menu_lv2})/ul/li
#                 ${total_menu_lv3}    SeleniumLibrary.Get Element Count    ${menu_lv2}
#                 FOR  ${index_n1_lv3}  IN RANGE  1    ${total_menu_lv3}+1  
#                     # Log To Console    ${menu['m${index_menu}_lv2']['n${index_m1_lv2}_lv3']['p${index_n1_lv3}']}
#                     Collections.Append To List    ${list_get}    ${menu['m${index_menu}_lv2']['n${index_m1_lv2}_lv3']['p${index_n1_lv3}']}
#                 END
#             END
#         ELSE IF  ${index_menu} == ${5}
#             # Log To Console    ${menu['m${index_menu}']}
#             Collections.Append To List    ${list_get}    ${menu['m${index_menu}']}
#             ${menu_lv1}    BuiltIn.Catenate    SEPARATOR=    (${notebook_search_locator['menu_level_1']})[${index_menu}]/div/ul/li
#             ${total_m1_lv2}    SeleniumLibrary.Get Element Count    ${menu_lv1}
#             ${total_m1_lv2}    BuiltIn.Evaluate    ${total_m1_lv2}*${2}
#             FOR  ${index_m1_lv2}  IN RANGE  1  ${total_m1_lv2}+1
#                 ${menu_lv2}    BuiltIn.Catenate    SEPARATOR=    (${menu_lv1})[${index_m1_lv2}]
#                 # Log To Console    ${menu['m${index_menu}_lv2']['n${index_m1_lv2}']}
#                 Collections.Append To List    ${list_get}    ${menu['m${index_menu}_lv2']['n${index_m1_lv2}']}
#             END
#         ELSE IF    ${index_menu} == ${6}
#             # Log To Console    ${menu['m${index_menu}']}
#             Collections.Append To List    ${list_get}    ${menu['m${index_menu}']}
#             ${menu_lv1}    BuiltIn.Catenate    SEPARATOR=    (${notebook_search_locator['menu_level_1']})[${index_menu}]/a
#             ${total_m1_lv2}    SeleniumLibrary.Get Element Count    ${menu_lv1}
#             FOR  ${index_m1_lv2}  IN RANGE  1  ${total_m1_lv2}+1
#                 ${menu_lv2}    BuiltIn.Catenate    SEPARATOR=    (${menu_lv1})[${index_m1_lv2}]
#                 # Log To Console    ${menu['m${index_menu}_lv2']['n${index_m1_lv2}']}
#                 Collections.Append To List    ${list_get}    ${menu['m${index_menu}_lv2']['n${index_m1_lv2}']}
#             END
#         END
#     END
#     RETURN   ${list_get}

Search notebook and count data
    [Arguments]    ${txt}
    SeleniumLibrary.Wait Until Element Is Visible    ${notebook_search_locator['count_notebook']}    timeout=${10s_timeout}
    common_web.Input text    ${notebook_search_locator['input_search_notebook']}        ${txt} 
    ${status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Contains    ${notebook_search_locator['name_notebook']}     ${txt}   timeout=${3s_timeout}
    WHILE  ${status}
        ${name_txt}    SeleniumLibrary.Get Text    ${notebook_search_locator['name_notebook']}
        ${name_txt}    String.Convert To Lower Case    ${name_txt}
        ${status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Contains    ${notebook_search_locator['name_notebook']}     ${txt}   timeout=${10s_timeout}
        ${round}    BuiltIn.Evaluate    ${round}+1
        IF  ${round} == ${3}
            ${status}  BuiltIn.Set Variable    ${True}
            Log    ${False}
        END
    END
    # ${status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Contains    ${notebook_search_locator['name_notebook']}    MacBook  #${txt.capitalize()}  timeout=${10s_timeout}
    # BuiltIn.Run Keyword And Return If  ${status} == ${False}    SeleniumLibrary.Wait Until Element Contains    ${notebook_search_locator['name_notebook']}    MacBook  #${txt}  timeout=${10s_timeout}
    ${text_result}    SeleniumLibrary.Get Text    ${notebook_search_locator['result_total']}
    ${total_page}    SeleniumLibrary.Get Element Count    ${notebook_search_locator['page_total']}
    ${rusult_total_notebook}    BuiltIn.Set Variable    ${0}
    @{list}   BuiltIn.Create List
    FOR  ${index_page}  IN RANGE  2   ${total_page}
        SeleniumLibrary.Wait Until Element Is Visible     ${notebook_search_locator['count_notebook']}    timeout=${10s_timeout}
        SeleniumLibrary.Scroll Element Into View    ${notebook_search_locator['target_click_page']}
        ${locator_page}    BuiltIn.Catenate    SEPARATOR=    (${notebook_search_locator['page_total']})[${index_page}]        
        SeleniumLibrary.Click Element        ${locator_page}   
        SeleniumLibrary.Wait Until Element Is Visible     ${notebook_search_locator['count_notebook']}    timeout=${10s_timeout}        
        SeleniumLibrary.Scroll Element Into View    ${notebook_search_locator['menu_level_1']}
        ${rusult_notebook}    SeleniumLibrary.Get Element Count    ${notebook_search_locator['count_notebook']}
        ${rusult_total_notebook}    BuiltIn.Evaluate    ${rusult_total_notebook}+${rusult_notebook}
        FOR  ${index_name}  IN RANGE  1    ${rusult_notebook}+1
            @{sub}    BuiltIn.Create List
            SeleniumLibrary.Wait Until Element Is Visible        ${notebook_search_locator['get_name_notebook']}    timeout=${10s_timeout}
            ${locator_name}    BuiltIn.Catenate    SEPARATOR=        (${notebook_search_locator['get_name_notebook']})[${index_name}]
            ...    ${notebook_search_locator['tail_name']}
            ${name_notebook}    SeleniumLibrary.Get Text    ${locator_name}
            Collections.Append To List    ${sub}    ${name_notebook}       
            IF  ${index_page} == ${2}
                ${locator_data}    BuiltIn.Set Variable    (${notebook_search_locator['get_name_notebook']})[${index_name}]${notebook_search_locator['tail_data']}
                ${total_data}    SeleniumLibrary.Get Element Count    ${locator_data}
            FOR  ${index_data}  IN RANGE  1    ${total_data}+1
                ${locator_data}    BuiltIn.Set Variable    (${notebook_search_locator['get_name_notebook']})[${index_name}]${notebook_search_locator['tail_data']}
                ${locator_data}    BuiltIn.Catenate    SEPARATOR=    (${locator_data})[${index_data}]
                ${name_data}    SeleniumLibrary.Get Text       ${locator_data}
                Collections.Append To List    ${sub}    ${name_data}
            END
            Collections.Append To List   ${list}    ${sub} 
            END
        END
    END
    Log To Console    ${list}
    ${get_total_show}    String.Split String    ${text_result} 
    ${get_total}    BuiltIn.Convert To Integer    ${get_total_show}[1]
    RETURN    ${get_total}    ${rusult_total_notebook}    ${list} 
    
        
    
    
        



    
