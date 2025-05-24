*** Settings ***
Library           RequestsLibrary
Resource          ../../../resources/keywords/ApiKeywords.robot
Variables         ../../../tests/api/variables/roles.py

Test Teardown     Delete All Sessions

*** Variables ***
${ENDPOINT}       /users

*** Test Cases ***
Super Admin Can Get User List
    ${ROLE}=      Set Variable    SUPER_ADMIN
    Create Auth Session As Role    ${ROLE}

    ${resp}=      Get Request    ${ROLE}    ${ENDPOINT}
    Should Be Equal As Integers    ${resp.status_code}    200

Manager Can Get User List
    ${ROLE}=      Set Variable    MANAGER
    Create Auth Session As Role    ${ROLE}

    ${resp}=      Get Request    ${ROLE}    ${ENDPOINT}
    Should Be Equal As Integers    ${resp.status_code}    200

Staff Cannot Access User List
    ${ROLE}=      Set Variable    STAFF
    Create Auth Session As Role    ${ROLE}

    ${resp}=      Get Request    ${ROLE}    ${ENDPOINT}
    Should Be Equal As Integers    ${resp.status_code}    403
