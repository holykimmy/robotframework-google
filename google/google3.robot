*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.google.com
${BROWSER}    chrome
*** Test cases ***
ทดสอบใส่คำค้น PIM ควรเจอ สถาบันการจัดการปัญญาภิวัฒน์
    open browser และเข้า google 
    ใส่คำค้นหา    PIM
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา    สถาบันการจัดการปัญญาภิวัฒน์

ทดสอบใส่คำค้น howl's ควรเจอ howl's moving castle
    open browser และเข้า google 
    ใส่คำค้นหา    howl's
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา    howl's moving castle

ทดสอบใส่คำค้น jake enhypen ควรเจอ jake
    open browser และเข้า google 
    ใส่คำค้นหา    jake enhypen
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา    jake

*** Keywords ***
open browser และเข้า google
    Open Browser    url=${URL}    browser=${BROWSER}

ใส่คำค้นหา 
    [Arguments]    ${search}
    Input Text    name=q    ${search}

กดปุ่ม Enter
    Press Keys    None    RETURN    

ตรวจสอบผลการค้นหา
    [Arguments]    ${find}
    Wait Until Page Contains    ${find}
