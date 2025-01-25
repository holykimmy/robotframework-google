*** Variables ***
${URL}    https://www.google.com
${BROWSER}    chrome


*** Keywords ***
open web browser
    Open Browser    browser=${BROWSER}
    
google 
    Go To    url=${URL}

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
    # Click Element    xpath=(//h3)[1]/ancestor::a
