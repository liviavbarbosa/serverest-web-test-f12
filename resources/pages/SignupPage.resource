*** Settings ***
Documentation        Elementos e ações da página de cadastro

Library        Browser
Resource        ../env.resource


*** Keywords ***
Go to signup page
    Go To    ${BASE_URL}/cadastrarusuarios

    # Tecnica Chekpoint (End-to-end)
    Wait For Elements State     css=h2.font-robot >> text=Cadastro      visible     5
    Get Text                    css=h2.font-robot >> text=Cadastro      equal       Cadastro

Submit signup form
    [Arguments]        ${user}

    #Procurar por css name ou placehouder (caso não tenha id)
    Fill Text    xpath=//*[@id="nome"]     ${user}[name]
    Fill Text    id=email                  ${user}[email]  
    Fill Text    id=password               ${user}[password]

    #Exemplo de combinação cd css com text
    Click        css=[type=submit] >> text=Cadastrar

Notice should be
    [Arguments]       ${expected_texto}
    # A mensagem é passado como argumento para a variável ${expected_texto}

    ${element}        Set Variable        css=.alert

    Wait For Elements State        ${element}      visible        5
    #Validação da mensagens de boas vindas pra garantir que foi cadastrado: 
    Get Text                       ${element}      equal      ${expected_texto}

# O alerta deve ser
Alert should be
    [Arguments]        ${expected_text}

    Wait For Elements State    text=${expected_text}
    ...    visible    5
