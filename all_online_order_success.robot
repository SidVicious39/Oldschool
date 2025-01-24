*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.allonline.7eleven.co.th
${BROWSER}    chrome

*** Test Cases ***
ลูกค้าสั่งซื้อสินค้าเลือกจัดส่งตามที่อยู่และชำระเงินด้วยบัตรเครดิต
    เปิดเว็บเบราว์เซอร์ และ เข้าเว็บ AllOnline
    Login เข้าสู่ระบบสมาชิก
    ค้นหาสินค้าด้วย คำค้นหา
    ตรวจสอบผลการค้นหา
    เลือกดูสินค้า
    ตรวจสอบส่วนลดสินค้าและสถานะสินค้า
    เพิ่มจำนวนสินค้าและเพิ่มลงตะกร้า
    ตรวจสอบรายระเอียดของสินค้าในตะกร้าและกดชำระสินค้า
    เลือกวิธีการจัดส่งเป็นจัดส่งตามที่อยู่
    ใส่ที่อยู่จัดส่งสินค้า
    เลือกวิธีการชำระเงิน
    ตรวจสอบรายละเอียดสินค้าและคะแนนAll Member ที่ได้รับ และกดสั่งซื้อ
    ตรวจสอบยอดรวมสินค้าทั้งหมด
    กรอกช้อมูล Credit Card
*** Keywords ***
เปิดเว็บเบราว์เซอร์ และ เข้าเว็บ AllOnline
    Open Browser    url=${URL}    browser=${BROWSER}
    Click Link    xpath=//*[@id="page"]/header/div[4]/div/div/div/ul/li[4]/a
Login เข้าสู่ระบบสมาชิก
    Input Text    name=email    vintage7093@gmail.com
    Input Text    name=password    Oldschool39!
    Click Link    xpath=//*[@id="__next"]/div/div/div[2]/div[2]/div/div/div/div[6]/a[1]
ค้นหาสินค้าด้วย คำค้นหา 
    Wait Until Page Contains    อภิชัย ไพจิตร    
    Input Text    name=q    โค๊ก
    Press Keys    None    RETURN
ตรวจสอบผลการค้นหา
    Wait Until Page Contains    ผลการค้นหาสำหรับ
เลือกดูสินค้า
    Execute JavaScript    document.querySelector('.alert-cookie-gdpr-allonline__content__1').style.display = 'none';
    Click Element    xpath=//a[@title='โค้กไม่มีน้ำตาล 1.25ลิตร (แพ็ก 6 ขวด) - cocacola, 7Online']
ตรวจสอบส่วนลดสินค้าและสถานะสินค้า
    Wait Until Page Contains    มีสินค้าในสต๊อก
    Wait Until Page Contains    18
เพิ่มจำนวนสินค้าและเพิ่มลงตะกร้า
    Execute JavaScript    document.querySelector('.alert-cookie-gdpr-allonline__content__1').style.display = 'none';
    Input Text    name=order_count    3
    Click Element    xpath=//*[@id="article-form"]/div[2]/div[2]/div[4]/div[1]/button
ตรวจสอบรายระเอียดของสินค้าในตะกร้าและกดชำระสินค้า
    Click Element    xpath=//*[@id="mini-basket"]/a/i
    Wait Until Page Contains    โค้กไม่มีน้ำตาล 1.25ลิตร
    Wait Until Page Contains    348    #ตรวจสอบราคารวมสินค้า
    Sleep    3s
    Click Link    xpath=//*[@id="mini-basket-val"]/li[5]/a[2]
เลือกวิธีการจัดส่งเป็นจัดส่งตามที่อยู่
    Click Element   xpath=//*[@id="address-tabs"]/ul/li[2]/a
ใส่ที่อยู่จัดส่งสินค้า    
    Sleep    3s
    # Click Element    xpath=//div[text()='เพิ่มที่อยู่ใหม่']  #สำหรับเลือกเพิ่มที่อยู่ใหม่
    Input Text    id:new-address-name    อภิชัย
    Input Text    id:new-address-lastname    ไพจิตร
    Input Text    id:new-address-mobile    0968369943
    Input Text    id:new-address-addrno    136/138
    Input Text    id:new-address-moo    3
    Input Text    id:new-address-soi    8
    Select From List By Label    id:new-address-province    สมุทรปราการ
    Select From List By Index    id:new-address-district    2
    Select From List By Index    id:new-address-sub-district    2
    Wait Until Page Contains    ระบุที่อยู่จัดส่ง
    Input Text    id:pac-input    หมู่บ้านพฤกษา126
    Wait Until Element Is Visible    xpath=//*[contains(text(), 'หมู่บ้าน พฤกษา เทพารักษ์-กิ่งแก้ว126 ตำบล บางพลีใหญ่ อำเภอบางพลี สมุทรปราการ')]
    Click Element    xpath=//*[contains(text(), 'หมู่บ้าน พฤกษา เทพารักษ์-กิ่งแก้ว126 ตำบล บางพลีใหญ่ อำเภอบางพลี สมุทรปราการ')]
    Click Element    id:selected-location
    # Click Element    xpath=//*[@id="addressbook"]/div[1]    #ใช้เลือกที่อยู่ที่มีอยู่แล้ว
    Wait Until Element Is Visible    id:continue-payment-btn
    Wait Until Element Is Enabled    id:continue-payment-btn
    Execute JavaScript    document.querySelector('#continue-payment-btn').click();
เลือกวิธีการชำระเงิน
    Wait Until Page Contains    วิธีการชำระเงิน
    Click Element    xpath=//*[@id="payment-options"]/div[1]
    Wait Until Page Contains    จ่ายผ่านบัตรเครดิต
    Sleep    10s
ตรวจสอบรายละเอียดสินค้าและคะแนนAll Member ที่ได้รับ และกดสั่งซื้อ
    Wait Until Page Contains    อภิชัย ไพจิตร    #ตรวจสอบชื่อ-นามสกุลผู้สั่ง
    Wait Until Page Contains    0968369943    #ตรวจสอบเบอร์โทร
    Wait Until Page Contains    136/138    #ตรวจสอบที่อยู่
    Wait Until Page Contains    บางพลีใหญ่ บางพลี สมุทรปราการ 10540    #ตรวจสอบที่อยู่
    Wait Until Page Contains    โค้กไม่มีน้ำตาล 1.25ลิตร (แพ็ก 6 ขวด)    #ตรวจสอบสินค้า
    Wait Until Page Contains    348    #ตรวจสอบราคาสินค้า
    Wait Until Page Contains    180    #ตรวจสอบคะแนน All Member
    Wait Until Page Contains    102    #ตรวจสอบราคาจัดส่ง
    Wait Until Page Contains    528    #ตรวจสอบราคาสินค้ารวมค่าจัดส่ง
    Run Keyword And Ignore Error    Click Element    css:.alert-cookie-gdpr-allonline button
    Execute JavaScript    document.querySelector('.continue-payment-btn-popup').click();
    Sleep    5s
ตรวจสอบยอดรวมสินค้าทั้งหมด
    Sleep    5s
    Wait Until Page Contains    หมายเลขสั่งซื้อ
    Wait Until Page Contains    528.00    #ตรวจสอบราคาสินค้ารวมค่าจัดส่ง
กรอกช้อมูล Credit Card
    Input Text    id:cardName    APICHAI PAIJIT
    Input Text    id:cardNumber    1234 5678 9123 4567
    Input Text    id:expiryDate    0927
    Input Text    id:cvCode    319
    Click Element    id:ckRemember
    Click Element    id:subFormPay
    Sleep    10s
