*** Settings ***
Library    SeleniumLibrary

Test Setup    open web browser to shoppingmall

*** Variables ***
${DEV_URL}    http://165.22.255.65/product/list
${SIT_URL}    http://159.223.71.75/product/list
${UAT_URL}
${BROWSER}    chrome

*** Test Cases ***
ทดสอบซื้อสินค้าและชำระเงินด้วย credit card ของ visa และชำระเงินสำเร็จ
    ค้นหาสินค้าด้วย คำค้นหา    bic
    ตรวจสอบผลการค้นหา    Balance Training Bicycle     4,314.60   
    เลือกดูสินค้า
    ตรวจสอบจำนวนแต้มต่อช้ินที่จะได้รับของ    43 Points
    เพิ่มจำนวนสินค้าที่ต้องการซื้อ
    เพิ่มสินค้าลงตระกร้า    1
    ตรวจสอบจำนวนแต้มต่อชิ้นที่จะได้รับของสินค้า    43 Points
    check out
    ใส่ที่อยู่จัดส่ง
    เลือกวิธีจัดส่งสินค้า
    ตรวจสอบค่าจัดส่งของ kerry เท่ากันกับ 50.00 บาท
    เลือกช่องทางการชำระเงินแบบ VISA Credit CArd

*** Keywords ***
open web browser to shoppingmall 
    Open Browser    url=${DEV_URL}    browser=${BROWSER} 

ค้นหาสินค้าด้วย คำค้นหา
    [Arguments]    ${search}
    Input Text    id=search-product-input    ${search}
    Click Element    id=search-product-btn

ตรวจสอบผลการค้นหา
    [Arguments]    ${result}    ${p_price}
    # Wait Until Page Contains    ${result} 
    Wait Until Element Is Visible    id=product-card-1
    Element Should Contain    id=product-card-name-1    ${result}
    Element Should Contain    id=product-card-price-1    ${p_price}

เลือกดูสินค้า
    Click Element    id:product-card-1

ตรวจสอบจำนวนแต้มต่อช้ินที่จะได้รับของ
    [Arguments]    ${p_points}
    Wait Until Element Is Visible    id:product-detail-point
    Element Should Contain    id:product-detail-point    ${p_points}

เพิ่มจำนวนสินค้าที่ต้องการซื้อ
    Click Element    id:product-detail-quantity-increment-btn
    Element Attribute Value Should Be    id:product-detail-quantity-input    attribute=value    expected=2

เพิ่มสินค้าลงตระกร้า
    [Arguments]    ${p_badge}
    # Click Element    id:product-detail-add-to-cart-btn
    Element Should Contain    id:header-menu-cart-badge    ${p_badge}

ตรวจสอบจำนวนแต้มต่อชิ้นที่จะได้รับของสินค้า
    [Arguments]    ${cart_point}
    Click Element    id:header-menu-cart-btn
    Wait Until Element Is Visible    id:product-1-point
    # Element Should Contain    id:product-1-point    ${cart_point}

check out
    Click Element    id:shopping-cart-checkout-btn

ใส่ที่อยู่จัดส่ง
    Wait Until Element Is Visible    id:product-1-point
    Element Should Contain    id:product-1-price    ฿4,314.60
    Element Should Contain    id:order-summary-subtotal-price    ฿4,314.60
    Element Should Contain    id:order-summary-receive-point-price    43 Points
    Element Should Contain    id:order-summary-shipping-fee-price    ฿50.00
    Element Should Contain    id:order-summary-total-payment-price    ฿4,364.60
    Input Text    id:shipping-form-first-name-input    testf
    Input Text    id:shipping-form-last-name-input    testl
    Input Text    id:shipping-form-address-input    202/143
    Select From List By Value    id:shipping-form-province-select    1
    Select From List By Value    id:shipping-form-district-select    1009
    Select From List By Value    id:shipping-form-sub-district-select    100905
    Input Text    id:shipping-form-mobile-input    0957924277

เลือกวิธีจัดส่งสินค้า
    Click Element    id:shipping-method-1-card

ตรวจสอบค่าจัดส่งของ kerry เท่ากันกับ 50.00 บาท
    Element Should Contain    id:order-summary-shipping-fee-price    ฿50.00

เลือกช่องทางการชำระเงินแบบ VISA Credit CArd
    Click Element    xpath:/html/body/div[1]/div/div/div/div/div[1]/div[4]/div

ตรวจสอบราคารวมที่ต้องชำระเงิน ต้องเท่ากันกับ
    Element Should Contain    id:order-summary-total-payment-price    ฿4,364.60


    




    