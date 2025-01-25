*** Settings ***
Library    SeleniumLibrary
Suite Setup    open web browser
Test Setup    google
# Test Teardown    Close Browser
Suite Teardown    Close All Browsers
Test Template    ค้นหาและตรวจสอบ
Resource    keywords.resource

*** Test cases ***                            
ทดสอบใส่คำค้น PIM ควรเจอ สถาบันการจัดการปัญญาภิวัฒน์    PIM    สถาบันการจัดการปัญญาภิวัฒน์

ทดสอบใส่คำค้น jjk ควรเจอ jujutsu    jjk    jujutsu

ทดสอบใส่คำค้น jake enhypen ควรเจอ jake    jake enhypen    jake
