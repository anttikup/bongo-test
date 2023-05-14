*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         bongo-phi.vercel.app
${BROWSER}        Firefox
${DELAY}          0
${VALID USER}     test
${VALID PASSWORD}    test
${HOME PAGE URL}    https://${SERVER}/
${LOGIN URL}      https://${SERVER}/login
${OVERVIEW URL}    https://${SERVER}/overview
${ERROR URL}    https://${SERVER}/api/auth/error?error=invalid%20username%20or%20password

*** Keywords ***
Open Browser To Home Page
    Open Browser    ${Home PAGE URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Wait Until Keyword Succeeds    1 min    5 sec     Home Page Should Be Open

Home Page Should Be Open
    Location Should Be    ${HOME PAGE URL}
    Title Should Be       Home | Duo Bongo

Go To Login Page
    Go To    ${HOME PAGE URL}
    Wait Until Keyword Succeeds    1 min    5 sec     Home Page Should Be Open
    Click Link       Log in
    Wait Until Keyword Succeeds    1 min    5 sec     Login Page Should Be Open

Open Browser To Login Page
    Open Browser To Home Page
    Home Page Should Be Open
    Go To Login Page
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Sign In

Overview Page Should Be Open
    Location Should Be    ${OVERVIEW URL}
    Title Should Be       Overview | Duo Bongo

Input Username
    [Arguments]    ${username}
    Input Text    input-username-for-login-provider    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    input-password-for-login-provider    ${password}

Submit Credentials
    Click Button    //button[contains(text(),'Sign in with Credentials')]
