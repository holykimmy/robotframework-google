*** Settings ***
Library    SeleniumLibrary

Test Setup    Open Browser to allonline
# Suite Teardown    Close All Browsers
*** Variables ***
${PROD_URL}    https://www.allonline.7eleven.co.th/
${BROWSER}    chrome

*** Test Cases ***
The customer placed an order with delivery to the specified address and paid via QR payment
    # Use your account as the email, password, and full name."
    Loging and skip register all member    test@gmail.com    testpassword    fullname
    Search for products using keywords    CCPets กล่องไม้ กระดาษข่วน รูปปลา SC592N    CCPets กล่องไม้ กระดาษข่วน รูปปลา SC592N 
    Check search results    ฿ 399    คุณจะได้รับ 117 คะแนน
    Add product to cart
    Check out    ฿ 399
    Select shipping method    CCPets กล่องไม้ กระดาษข่วน รูปปลา SC592N    กาญจนา    มงคล    0903958789    56/89    -    -    สามเสน    -    กรุงเทพมหานคร    ดุสิต    ดุสิต
    Proceed to payment    CCPets กล่องไม้ กระดาษข่วน รูปปลา SC592N    ฿ 399    ฿ 35    ฿ 434
    Select payment with QR Payment
    Complete payment via QR

*** Keywords ***
Open Browser to allonline
    Open Browser    url=${PROD_URL}    browser=${BROWSER} 
Loging and skip register all member
    [Arguments]    ${email}    ${password}    ${user}
    Click Element    xpath://*[@id="page"]/header/div[4]/div/div/div/ul/li[4]/a
    Input Text    name:email    ${email}
    Input Password    name:password    ${password}
    Click Element    xpath://*[@id="__next"]/div/div/div[2]/div[2]/div/div/div/div[6]/a[1]
    Wait Until Element Is Visible    xpath://*[@id="__next"]/div/div/div[2]/div[2]/div/div/div[1]/h1
    Click Element    xpath://*[@id="__next"]/div/div/div[2]/div[2]/div/div/div[3]/div/button[2]
    Wait Until Element Is Visible    id:login-dropdown
    Element Should Contain    id:login-dropdown    ${user}

Search for products using keywords
    [Arguments]    ${search}    ${result}
    Input Text    name=q    ${search}
    Press Keys    None    RETURN
    Wait Until Element Is Visible    xpath://*[@id="page"]/div[2]/div[2]/div/div/div[2]/div/div/div/h1
    Element Should Contain    xpath=//*[@id="page"]/div[2]/div[2]/div/div/div[2]/div/div/div/div/div/div[3]/div[1]/div/a[2]/div    ${result}
    
Check search results
    [Arguments]    ${current_price}    ${points}
    Click Element    xpath://*[@id="page"]/div[2]/div[2]/div/div/div[2]/div/div/div/div/div/div[3]/div[1]/div/a[1]
    Wait Until Element Is Visible    xpath://*[@id="page"]/div[2]/div[2]/section
    Element Should Contain    xpath://*[@id="article-form"]/div[2]/span/div/div[1]/span     ${current_price}
    Element Should Contain    xpath://*[@id="article-form"]/div[1]/div[3]/div/div[2]/div/span/span     ${points}

Add product to cart
    Click Element    xpath://*[@id="article-form"]/div[2]/div[2]/div[4]/div[1]/button
    Wait Until Element Is Visible    xpath://*[@id="mini-basket-val"]
    Element Attribute Value Should Be    name:order_count    attribute=value    expected=1

Check out
    [Arguments]    ${price}
    Click Element    id:mini-basket
    Wait Until Element Is Visible    xpath://*[@id="page"]/div[2]/div[2]/div[2]/div
    Element Should Contain    xpath://*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[9]/div/div[2]/span[1]    ${price}
    Click Element    xpath://*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[10]/div/div/div/a
    
Select shipping method
    [Arguments]    ${product}    ${fname}    ${lname}    ${phone}    ${addr_no}    ${addr_floor}    ${addr_moo}    ${addr_soi}    ${addr_street}    ${province}    ${district}    ${subdistric}
    Wait Until Element Is Visible    xpath://*[@id="page"]/div
    Element Should Contain    xpath://*[@id="stepModel"]/div[1]/div[1]/div[2]/div[1]/div/div[2]/span[2]    ${product}
    Click Element    xpath://*[@id="address-tabs"]/ul/li[2]/a
    Click Element    xpath://*[@id="address"]/div[1]/div[2]
    Input Text    id:new-address-name    ${fname}
    Input Text    id:new-address-lastname    ${lname}
    Input Text    id:new-address-mobile    ${phone}
    Input Text    id:new-address-addrno    ${addr_no}
    Input Text    id:new-address-floor    ${addr_floor}
    Input Text    id:new-address-moo    ${addr_moo}
    Input Text    id:new-address-soi    ${addr_soi}
    Input Text    id:new-address-street    ${addr_street}
    Select From List By Value    id:new-address-province    ${province}
    Select From List By Value    id:new-address-district    ${district}
    Select From List By Value    id:new-address-sub-district    ${subdistric}
    Wait Until Element Is Visible    id:gcp-map    timeout=15s
    Wait Until Element Is Visible    id:selected-location    timeout=10s
    Wait Until Element Is Enabled    id:selected-location    timeout=10s
    Sleep    2s
    Click Element    id:selected-location
    Wait Until Element Is Visible    id:def-locate    timeout=10s
    Click Element    xpath://*[@id="conf-dif-addr"]


Proceed to payment
    [Arguments]    ${product}    ${price}    ${shipping}    ${total_amount}
    Wait Until Element Is Visible    id:continue-payment-btn
    Click Button    id:continue-payment-btn
    Wait Until Element Is Visible    xpath://*[@id="page"]/div
    Element Should Contain    xpath://*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[3]/td[2]    ${product}
    Element Should Contain    xpath://*[@id="js-invoice-details-tbody"]/tr[1]/td[2]/b    ${price}
    Element Should Contain    xpath://*[@id="js-invoice-details-tbody"]/tr[2]/td[2]/b    ${shipping}
    Element Should Contain    id:totalAmount    ${total_amount}

Select payment with QR Payment
    Wait Until Element Is Visible    xpath://*[@id="payment-options"]/div[4]/button    timeout=5s
    Click Button    xpath://*[@id="payment-options"]/div[4]/button
    Wait Until Element Is Visible    xpath://*[@id="COUNTERSERVICE_QR-tab"]/div/div   timeout=10s
    Click Button    xpath://*[@id="stepModel"]/div[1]/div[2]/footer/div/div/button

Complete payment via QR
    Wait Until Element Is Visible   xpath://*[@id="stepModel"]/div[1]/div[2]/footer/div/div/button/i



    
    
    