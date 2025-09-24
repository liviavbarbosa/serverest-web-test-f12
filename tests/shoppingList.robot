*** Settings ***
Documentation    Cenários de gerenciamento de lista de desejos
Resource         ../resources/base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve permitir a adição de um produto na lista de compras
    ${user}    Get fixture    credenciais    usuario_cadastrado
    Do normal user login                     ${user}
    Add product to shopping list             Logitech MX Vertical
    Product should be in shopping list       Logitech MX Vertical


Deve permitir a limpeza dos produtos da lista de compras
    ${user}    Get fixture    credenciais    usuario_cadastrado
    Do normal user login                     ${user}
    Add product to shopping list             Samsung 60 polegadas
    Product should be in shopping list       Samsung 60 polegadas
    Clear shopping list