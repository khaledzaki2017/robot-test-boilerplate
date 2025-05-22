*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}       ${BASE_URL}/login
${USERNAME_INPUT}    id=username
${PASSWORD_INPUT}    id=password
${LOGIN_BUTTON}      id=loginBtn
${ERROR_MESSAGE}     id=errorMsg

*** Keywords ***
Open Login Page
    Go To    ${URL}
    Maximize Browser Window

Input Username    ${username}
    Input Text    ${USERNAME_INPUT}    ${username}

Input Password    ${password}
    Input Text    ${PASSWORD_INPUT}    ${password}

Click Login Button
    Click Button    ${LOGIN_BUTTON}

Login Should Be Successful
    Location Should Contain    dashboard

Login Should Fail With Message    ${expected_message}
    Element Text Should Be    ${ERROR_MESSAGE}    ${expected_message}
