*** Settings ***
Documentation    Ações e elementos da página home
Library          Browser

*** Keywords ***
User should be logged in 
    ${element}         Set Variable     xpath=//h1

    Wait For Elements State             ${element}   
    ...                visible          5
    
    Get Text    ${element}     equal    Serverest Store

User should be logged in as administrador
    [Arguments]        ${name}
    ${element}         Set Variable     xpath=//h1

    Wait For Elements State             ${element}   
    ...                visible          5
    
    Get Text    ${element}     equal    Bem Vindo ${name}

Add product to shopping list
    [Arguments]    ${product_name}
    ${element}     Set Variable        xpath=//h5[text()="${product_name}"]/ancestor::div[contains(@class,'card col-3')]//button[@data-testid='adicionarNaLista']
    Wait For Elements State            ${element}  
    ...            visible             5
    Click          ${element}