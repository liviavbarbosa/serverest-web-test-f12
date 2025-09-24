*** Settings ***
Documentation    Ações comuns dos cenários de teste

Library          Browser
Library          FakerLibrary
Library          JSONLibrary
Library          Collections

Resource         env.resource
Resource         pages/LoginPage.resource
Resource         pages/HomePage.resource
Resource         pages/components/Alert.resource
Resource         pages/SignupPage.resource

*** Keywords ***
Start session
    New Browser    browser=${BROWSER}    headless=False
    New Page       ${BASE_URL}

Get fixture
    [Arguments]    ${file_name}    ${scenario}
    ${data}     Load Json From File    ${EXECDIR}/resources/fixtures/${file_name}.json    
    ...         encoding=utf-8
    [Return]    ${data}[${scenario}]