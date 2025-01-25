*** Settings ***
Library    SeleniumLibrary

Suite Setup     open web browser
Test Setup    allonline
Suite Teardown    Close All Browsers

*** Variables ***
${URL}    https://www.allonline.7eleven.co.th/
${BROWSER}    chrome

*** Test cases ***
ทดสอบใส่คำค้นหา fineline ควรเจอ ผลการค้นหา 
    ใส่คำค้นหา    ไฟน์ไลน์
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา    ผลการค้นหาสำหรับ »ไฟน์ไลน์«
    
*** Keywords ***
open web browser
    Open Browser    browser=${BROWSER}
    
allonline
    Go To    url=${URL}

ใส่คำค้นหา
    [Arguments]    ${search}
    Input Text    name=q    ${search}

กดปุ่ม Enter
    Press Keys    None    RETURN

ตรวจสอบผลการค้นหา
    [Arguments]    ${result}
    Wait Until Page Contains    ${result}


