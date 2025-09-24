*** Settings ***
Documentation       Cenário de testes do cadastro de usuários
Resource    ../resources/base.resource

# Test Setup        Log    Tudo aqui ocorre antes da Suite (antes de todos os testes)
# Test Teardown     Log    Tudo aqui ocorre deois da Suite (depois de todos os testes)

Test Setup        Start Session
Test Teardown     Take Screenshot
Library           OperatingSystem

*** Test Cases ***
CT001 Deve poder cadastrar um novo usuário
    [Tags]        CT001
    ${nome}   FakerLibrary.Color
    ${user}    Create Dictionary
    ...    name=TestCT0001
    ...    email=${nome}ct0001@mail.com
    ...    password=pwd123


    # test cases de signupPage
    Go to signup page
    Submit signup form        ${user}
    Notice should be          ×\nCadastro realizado com sucesso

CT002 Não deve permitir o cadastro com email duplicado
    [Tags]        CT002

    ${random_color}   FakerLibrary.Color

    ${user}    Create Dictionary
    ...    name=Teste CT002
    ...    email=${random_color}ct0002@mail.com
    ...    password=pwd123
    

    ${user2}    Create Dictionary
    ...    name=Teste CT002
    ...    email=${random_color}ct0002@mail.com
    ...    password=pwd123


    # test cases de signupPage
    Go to signup page
    Submit signup form        ${user}
    Notice should be          ×\nCadastro realizado com sucesso

    Go to signup page
    Submit signup form        ${user2}
    Notice should be          ×\nEste email já está sendo usado


CT003 Campos obrigatórios
    [Tags]        CT003
    ${user}        Create Dictionary
    ...            name=${EMPTY}
    ...            email=${EMPTY}
    ...            password=${EMPTY}


    Go to signup page
    Submit signup form        ${user}

    Alert should be    Nome é obrigatório
    Alert should be    Email é obrigatório
    Alert should be    Password é obrigatório

CT004 Não deve cadastrar com email incorreto
    [Tags]        CT004
    ${user}            Create Dictionary
    ...                name=TestCT004
    ...                email=ct004.mail.com
    ...                password=pwd123
    
    Go to signup page
    Submit signup form        ${user}
    Wait For Elements State    css=div:nth-child(3)

    ...    visible    5      
