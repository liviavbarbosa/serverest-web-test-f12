*** Settings ***
Documentation        Ações e lementos do componente de mensagens de alertas

Library        Browser


*** Keywords ***

Alert should be
    [Arguments]        ${expected_text}

    Wait For Elements State    text=${expected_text}
    ...    visible    5

Notice should be
    [Arguments]       ${expected_texto}
    # A mensagem é passado como argumento para a variável ${expected_texto}

    ${element}        Set Variable        css=.alert

    Wait For Elements State        ${element}      visible        5
    Get Text                       ${element}      equal      ${expected_texto}