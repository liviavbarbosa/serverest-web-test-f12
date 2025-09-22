*** Settings ***
Documentation    Cenários de autenticação do usuário
Resource         ../resources/base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve permitir o login de um usuário comum pré-cadastrado
    ${user}    Get fixture    credenciais    usuario_cadastrado
    Submit login form            ${user}
    User should be logged in     

Deve permitir o login de um usuário administrador pré-cadastrado
    ${user}    Get fixture    credenciais    usuario_adm_cadastrado
    Submit login form                             ${user}
    User should be logged in as administrador     ${user}[name]

Não deve permitir o login com campos vazios
    ${user}    Create Dictionary    
    ...        email=${EMPTY}
    ...        password=${EMPTY}
    Submit login form            ${user}
    Alert should be              Email é obrigatório
    Alert should be              Password é obrigatório
Não deve permitir o login de um usuário não cadastrado
    ${email}       FakerLibrary.Email
    ${password}    FakerLibrary.Password
    ${user}        Create Dictionary    
    ...            email=${email}
    ...            password=${password}
    Submit login form            ${user}
    Alert should be              Email e/ou senha inválidos

Não deve permitir o login com senha incorreta
    ${user}    Get fixture    credenciais    usuario_cadastrado
    Set To Dictionary            ${user}     password=teste4321
    Submit login form            ${user}
    Alert should be              Email e/ou senha inválidos