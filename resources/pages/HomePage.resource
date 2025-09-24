*** Settings ***
Documentation    Ações e elementos da página home
Library          Browser

*** Keywords ***
User should be logged in 
    ${element}         Set Variable     xpath=//h1

    Wait For Elements State             ${element}   
    ...         visible        5
    
    Get Text    ${element}     equal    Serverest Store

User should be logged in as administrador
    [Arguments]        ${name}
    ${element}         Set Variable     xpath=//h1

    Wait For Elements State             ${element}   
    ...         visible        5
    
    Get Text    ${element}     equal    Bem Vindo ${name}