*** Settings ***
Documentation     A test suite with a single test for valid login.
Resource          resource.robot

*** Test Cases ***
Valid Login With Username And Password
    Open Browser To Login Page
    Login Page Should Be Open

    Input Username    test
    Input Password    test
    Submit Credentials

    Wait Until Keyword Succeeds    1 min    5 sec     Overview Page Should Be Open
    [Teardown]    Close Browser
