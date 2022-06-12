*** Settings ***
Library    Selenium2Library

*** Test Cases ***
TC1 Click button "Click for js alert "
    Open Browser    https://the-internet.herokuapp.com/javascript_alerts    chrome
    Click Element    //ul/li[1]/button    #Click for js alert button
    Handle Alert    ACCEPT    #click ok-->Result:You successfully clicked an alert
TC2 Click button "Click for js confirm"
    Click Element    //ul/li[2]/button    #Click for js confirm button
    Handle Alert    DISMISS    #click ok-->Result:You clicked:Cancel

TC3 Click button "Click for js prompt" and input text into alert
    Click Element    //ul/li[3]/button    #Click for js confirm button
    Input Text Into Alert    Napaphorn    #Result: You entered: Napaphorn
    Close All Browsers

TC4 Switch Browser
    ${a}=    Open Browser    https://www.google.com    chrome
    ${b}=    Open Browser    https://www.google.co.in     chrome
    Switch Browser    ${a}
    Maximize Browser Window
    Input Text    //input[@class='gLFyf gsfi']    Robot FrameWork

    Switch Browser    ${b}
    Maximize Browser Window
    Input Text    //input[@class='gLFyf gsfi']    Selenium2Library

    Close All Browsers
    
TC5 Frame
    Open Browser    https://the-internet.herokuapp.com/nested_frames    chrome
    Select Frame    //frame[@src='/frame_top']
    Select Frame    //frame[@src='/frame_middle']
    ${a}=    Get Text    //div[@id='content']
    Log    ${a}
