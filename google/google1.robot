*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Test cases ***
ทดสอบใส่คำค้น PIM ควรเจอ สถาบันการจัดการปัญญาภิวัฒน์
    open browser และเข้า google 
    ใส่คำค้นหา
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา

*** Keywords ***
open browser และเข้า google
    Open Browser    url=https://www.google.com    browser=chrome

ใส่คำค้นหา 
    Input Text    name=q    PIM

กดปุ่ม Enter
    Press Keys    None    RETURN    

ตรวจสอบผลการค้นหา
    Wait Until Page Contains    สถาบันการจัดการปัญญาภิวัฒน์


