*** Settings ***
Library    Selenium2Library

*** Test Cases ***
TC1 Click link A/B Testing
    Open Browser    http://the-internet.herokuapp.com/    chrome
    Click Element    xpath=//a[@href='/abtest']
    ${title}=    Get Text    xpath=//h3
    Log To Console    ${title}
    Sleep    3
    Close All Browsers

TC2 Click link Add/Remove Elements
    #Create Button->Add Element
    Open Browser    http://the-internet.herokuapp.com/add_remove_elements/    chrome  

    FOR    ${i}    IN RANGE    1    6    
        Click Button    xpath=//button[text()='Add Element']
    END
    
    #Delete Button
    FOR    ${i}    IN RANGE    1    6    
        Click Button    xpath=//div[@id='elements']/button[1]
        
    END

    Sleep    3
    Close All Browsers

TC3 Click link Checkboxes
    Open Browser    http://the-internet.herokuapp.com/checkboxes    chrome
    Checkbox Should Be Selected    //form/input[2]
    Click Element    //form/input[2]
    Checkbox Should Not Be Selected    //form/input[1]
    Click Element    //form/input[1]
    Sleep    3
    Close All Browsers

TC4 Login
    Open Browser    https://the-internet.herokuapp.com/login    chrome
    Input Text    //input[@id='username']    admin
    Input Password    //input[@id='password']    admin
    Click Button    //button[@class='radius']
    Sleep    3
    Close All Browsers

TC5 Disappearing elements and Screenshot
    Open Browser    https://the-internet.herokuapp.com/disappearing_elements    chrome
    Capture Element Screenshot    css:div.example    #cap บางส่วน
    #Capture Page Screenshot    cap ทั้งหน้า
    Sleep    3
    Close Browser

TC6 Upload File
    Open Browser     https://the-internet.herokuapp.com/upload    chrome
    Choose File    id:file-upload    C:/Users/Napaphorn/Desktop/Texture/5283302.png
    Click Button    id:file-submit
    Sleep    3
    Close All Browsers

TC7 Mouse Over Upload Button
    Open Browser     https://the-internet.herokuapp.com/upload    chrome
    Sleep    5
    Mouse Over       id:file-submit
    Sleep    5
    Mouse Over       id:file-submit
    Sleep    3
    Close All Browsers
