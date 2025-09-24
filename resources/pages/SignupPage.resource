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




