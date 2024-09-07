*** Settings ***
Library         SeleniumLibrary
Resource        ../keywords/Register.robot
Variables       ../resources/config/config.yaml
Variables       ../resources/testdata/testdata.yaml
Suite Setup        Open Browser    ${baseUrl}    chrome
Suite Teardown     Close Browser

*** Test Cases ***
User want to register
    when user register to future skill platform input ${email} and ${firstname} and ${lastname} and ${phone} and ${password} and ${confirmpassword}
    then future skill should display display homepage and display message as "ระบบได้ส่งรหัส OTP ไปยังเบอร์โทรศัพท์"