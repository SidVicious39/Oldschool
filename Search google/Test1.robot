*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    https://www.google.co.th

*** Keywords ***

*** Test Cases ***
google homepage
    Open Browser    ${URL}    ${BROWSER}
        ...    options=add_experimental_option("detach", True)
    Input Text    //*[@id="APjFqb"]    facebook
    Sleep    3s
    Click Element    //*[@name="btnK"]
    sleep    3s
    Close Browser