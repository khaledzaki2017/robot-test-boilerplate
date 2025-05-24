*** Settings ***
Library    RequestsLibrary
Library    ../../libs/EnvLoader.py
Library    Collections
Library    BuiltIn
Library    ../../libs/SessionManager.py

*** Variables ***
${LOGIN_ENDPOINT}    ${EMPTY}    # Set dynamically from .env

*** Keywords ***
Create Auth Session As Role
    [Arguments]    ${role}
    ${base_url}=         Get Env Variable    AUTH_API_BASE_URL
    ${login_path}=       Get Env Variable    LOGIN_ENDPOINT

    ${username_key}=     Set Variable    ${role.upper()}_USERNAME
    ${password_key}=     Set Variable    ${role.upper()}_PASSWORD

    ${username}=         Get Env Variable    ${username_key}
    ${password}=         Get Env Variable    ${password_key}

    Create Session    login    ${base_url}
    ${payload}=       Create Dictionary    username=${username}    password=${password}
    ${headers}=       Create Dictionary    Content-Type=application/json
    ${response}=      Post Request    login    ${login_path}    json=${payload}    headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    200

    ${token}=         Set Variable    ${response.json()['token']}
    ${auth_headers}=  Create Dictionary    Authorization=Bearer ${token}    Content-Type=application/json

    Create Session    ${role}    ${base_url}    headers=${auth_headers}
    # Clean up temp login session
    Delete Session By Name    login

GET Resource As Role
    [Arguments]    ${role}    ${endpoint}
    ${response}=   Get Request    ${role}    ${endpoint}
    RETURN      ${response}

Status Should Be
    [Arguments]    ${response}    ${expected_status}
    Should Be Equal As Integers    ${response.status_code}    ${expected_status}
