*** Settings ***
Documentation    Ações e elementos da página de lista de compras
Library          Browser

*** Keywords ***
Product should be in shopping list
    [Arguments]    ${expected_name}
    Wait For Elements State            css=[data-testid="shopping-cart-product-name"] >> text=Produto:${expected_name}
    ...            visible             5

Clear shopping list
    ${element}        Set Variable        css=[data-testid=limparLista]  
    Wait For Elements State               ${element}  
    ...               visible             5
    Click    ${element}