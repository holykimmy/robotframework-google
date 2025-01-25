*** Settings ***
Library    SeleniumLibrary

Test Setup    open web browser to google
Test Teardown    Close Browser

Test Template    ค้นหาและตรวจสอบ

*** Variables ***
${URL}    https://www.google.com
${BROWSER}    chrome

*** Test cases ***                            

ทดสอบใส่คำค้น PIM ควรเจอ สถาบันการจัดการปัญญาภิวัฒน์    PIM    สถาบันการจัดการปัญญาภิวัฒน์

ทดสอบใส่คำค้น jjk ควรเจอ jujutsu    jjk    jujutsu

ทดสอบใส่คำค้น jake enhypen ควรเจอ jake    jake enhypen    jake

*** Keywords ***
open web browser to google
    Open Browser    url=${URL}    browser=${BROWSER}

ค้นหาและตรวจสอบ
    [Arguments]    ${search}    ${result}
    ใส่คำค้นหา    ${search}
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา    ${result}

ใส่คำค้นหา 
    [Arguments]    ${search}
    Input Text    name=q    ${search}

กดปุ่ม Enter
    Press Keys    None    RETURN    

ตรวจสอบผลการค้นหา
    [Arguments]    ${result}
    Wait Until Page Contains    ${result}
    Click Element    xpath=(//h3)[1]/ancestor::a
