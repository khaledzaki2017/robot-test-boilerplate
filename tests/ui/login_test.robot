*** Settings ***
Resource    ../../resources/keywords/CommonKeywords.robot
Resource    ../../resources/pages/LoginPage.robot

*** Test Cases ***
Valid Login Test
    Setup Browser
    Open Login Page
    Input Username    ${USERNAME}
    Input Password    ${PASSWORD}
    Click Login Button
    Login Should Be Successful
    Teardown Browser

Invalid Login Test
    Setup Browser
    Open Login Page
    Input Username    invalidUser
    Input Password    invalidPass
    Click Login Button
    Login Should Fail With Message    Invalid credentials
    Teardown Browser
