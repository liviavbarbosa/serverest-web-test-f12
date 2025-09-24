*** Settings ***
Documentation    Ações e elementos do componente de mensagens de alertas
Library          Browser

*** Keywords ***
Alert should be
    [Arguments]                ${expected_text}
    Wait For Elements State    css=.alert >> text=${expected_text}    
    ...         visible        5
    
Notice should be
    [Arguments]       ${expected_texto}

    ${element}        Set Variable        css=.alert

    Wait For Elements State        ${element}      visible        5
    Get Text                       ${element}      equal      ${expected_texto}