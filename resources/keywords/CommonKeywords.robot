*** Settings ***
Library    SeleniumLibrary
Library    libs.EnvLoader

*** Variables ***
${BASE_URL}    ${EMPTY}
${BROWSER}     ${EMPTY}

*** Keywords ***
Setup Browser
    ${BASE_URL}=    Get Env Variable    BASE_URL
    ${BROWSER}=     Get Env Variable    BROWSER
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window

Teardown Browser
    Close Browser
