*** Settings ***
Resource    ${CURDIR}/../resources/import.robot
*** Variables ***
${input}    10
*** Keywords ***
Star_peramid_up
    [Arguments]    ${input}
    FOR  ${index}  IN RANGE  1  ${input}+1  2
        Log To Console    ${index}
        ${space}     Set Variable    ${input}
        ${space}    BuiltIn.Evaluate     " " * (${space}-${index})
        ${stars}    BuiltIn.Evaluate     " *" * ${index}
        Log To Console    \n${space}${stars}
     END

Star_peramid_down
    [Arguments]    ${input}
    IF  ${input}%${2} > ${0}
        FOR  ${index}  IN RANGE  ${input}  0  -2
            Log To Console    ${index}
            ${space}     Set Variable    ${input}
            ${space}    BuiltIn.Evaluate     " " * (${space}-${index})
            ${stars}    BuiltIn.Evaluate     " *" * ${index}
            Log To Console    \n${space}${stars}
        END
    ELSE IF    ${input}%${2} == ${0}    
        FOR  ${index}  IN RANGE  ${input}-${1}  0  -2
            Log To Console    ${index}
            ${space}     Set Variable    ${input}
            ${space}    BuiltIn.Evaluate     " " * (${space}-${index})
            ${stars}    BuiltIn.Evaluate     " *" * ${index}
            Log To Console    \n${space}${stars}
        END
    END
Star_peramid_left
    FOR  ${index}  IN RANGE  ${input}-${1}  0  -2
            Log To Console    ${index}
            ${space}     Set Variable    ${input}
            ${space}    BuiltIn.Evaluate     " " * (${space}-${index})
            ${stars}    BuiltIn.Evaluate     " *" * ${index}
            Log To Console    \n${space}${stars}
        END
        
*** Test Cases ***   
Tc_01
    Star_peramid_up         ${input}

Tc_02
    Star_peramid_down       ${input}

    