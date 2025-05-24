*** Settings ***
Library    RequestsLibrary
Library    ../../libs/SessionManager.py

*** Test Cases ***
Should Create And Delete Temp Session
    Create Session    temp    https://jsonplaceholder.typicode.com
    ${response}=    Get Request    temp    /posts/1
    Should Be Equal As Integers    ${response.status_code}    200
    Delete Session By Name    login
