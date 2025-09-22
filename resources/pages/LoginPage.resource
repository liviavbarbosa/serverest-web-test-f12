*** Settings ***
Documentation    Ações e elementos da página de login
Library          Browser

*** Keywords ***
Submit login form
    [Arguments]    ${user}                       
    Fill Text      id=email                        ${user}[email]
    Fill Text      id=password                     ${user}[password]
    Click          css=[data-testid=entrar]