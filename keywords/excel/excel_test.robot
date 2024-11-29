*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot
*** Keywords ***
Read Data From Excel
    [Arguments]    ${file_name}   ${doc_id}    ${sheet_name}    ${row_num}    ${colum_num}     
    ${workbook}   ExcelLibrary.Open Excel Document       ${file_name}    ${doc_id}          
    ${sheet}      ExcelLibrary.Get Sheet    ${sheet_name}    
    ${value}      ExcelLibrary.Read Excel Cell   ${row_num}    ${colum_num}
    Log To Console    ${value}
    [Teardown]    ExcelLibrary.Close Current Excel Document   
    
