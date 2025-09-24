*** Settings ***

Library        Browser
Library        FakerLibrary    locale=pt_BR

Resource       env.resource

Resource       pages/components/Alert.resource
Resource       pages/SignupPage.resource



*** Keywords ***
Start Session
    
    New Browser     browser=${BROWSER}      headless=False
    New Page        ${BASE_URL}

