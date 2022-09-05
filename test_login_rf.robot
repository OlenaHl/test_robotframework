*** Settings ***
Library  SeleniumLibrary
Documentation  Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}         https://scouts-test.futbolkolektyw.pl/en
${BROWSER}           Chrome
${SIGNINBUTTON}     xpath=//*[(text()='Sign in')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}    xpath=//*[@id='password']
${PAGELOGO}         xpath=//*[@id='__next']/div[1]/main/div[3]/div[1]/div/div[1]
${SIGNOUTBUTTON}    xpath=//*[(text()='Sign out')]
${PLAYERSBUTTON}    xpath=//div[2]/div[2]/span
${MAINPAGEBUTON}    xpath=//div[1]/div[2]/span
${REMINDPASSWORDBUTTON}     xpath=//*[(text()='Remind password')]
${ADDPLAYERBUTTON}      xpath=//*[(text()='Add player')]
${NAMEINPUT}        xpath=//input[@name='name']
${SURNAMEINPUT}     xpath=//input[@name='surname']
${AGEINPUT}     xpath=//input[@name='age']
${MAINPOSITIONINPUT}        xpath=//input[@name='mainPosition']
${SUBMITBUTTON}     xpath=//*[(text()='Submit')]

*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Assert dashboard
    [Teardown]  Close Browser

Sign out
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Assert dashboard
    Click on the Sign out button
    Sleep    3
    [Teardown]  Close Browser

Main page
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Assert dashboard
    Click on the players button
    Sleep    3
    Click on the main page button
    Sleep    3
    [Teardown]  Close Browser

Players
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Assert dashboard
    Click on the players button
    Sleep    3
    [Teardown]  Close Browser

Remind password
    Open login page
    Type in email
    Type in password blank
    Sleep    3
    Click on the remind password button
    Sleep    5
    [Teardown]  Close Browser

Add player
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Assert dashboard
    Sleep    3
    Click on the add player button
    Type in name
    Type in surname
    Type in age
    Type in main position
    Click on the Submit button
    Sleep    5
    [Teardown]  Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Scouts panel - sign in
Type in email
    Input Text   ${EMAILINPUT}  user07@getnada.com
Type in password
    Input Text    ${PASSWORDINPUT}  Test-1234
Click on the Sign in button
    Click Element    xpath=//*[(text()='Sign in')]
Click on the Sign out button
    Click Element    xpath=//*[(text()='Sign out')]
Click on the players button
    Click Element    xpath=//div[2]/div[2]/span
Click on the main page button
    Click Element    xpath=//div[1]/div[2]/span
Click on the remind password button
    Click Element    xpath=//*[(text()='Remind password')]
Type in password blank
    Input Text    ${PASSWORDINPUT}  None
Click on the add player button
    Click Element   xpath=//*[(text()='Add player')]
Type in name
    Input Text     ${NAMEINPUT}   Adam
Type in surname
    Input Text      ${SURNAMEINPUT}     Tomson
Type in age
    Input Text      ${AGEINPUT}     15.05.2000
Type in main position
    Input Text      ${MAINPOSITIONINPUT}        front
Click on the Submit button
    Click Element    xpath=//*[(text()='Submit')]
Assert dashboard
    Wait Until Element Is Visible    ${PAGELOGO}
    Title Should Be     Scouts panel
    Capture Page Screenshot    alert.png


