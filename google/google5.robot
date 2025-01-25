*** Settings ***
Library    SeleniumLibrary

Test Setup    open web browser to google
Test Teardown    Close Browser

*** Variables ***
${URL}    https://www.google.com
${BROWSER}    chrome

*** Test cases ***

ทดสอบใส่คำค้นควรเจอผลลัพธ์ที่ต้องการ
    [Template]    ค้นหาและตรวจสอบ
    PIM    สถาบันการจัดการปัญญาภิวัฒน์
    howl's    howl's moving castle
    jake enhypen    jake

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
