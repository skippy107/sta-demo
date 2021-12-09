*** Settings ***

Resource          ../adapters/SeleniumLibrary.txt
Library           OperatingSystem
Library           String

Documentation     Defines all resources and keywords 
...               handling the application object
...
...  

*** Variables ***

${App.Url}    ${APP_URL}
${App.PageTitle}    ${APP_PAGETITLE}

*** Keywords ***
Open
    [Documentation]  Open the browser and navigate to the application home page
    # Webdriver Method - use if you need to pass chrome options
    #${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    #Call Method    ${chrome options}    add_argument    --disable-notifications            
    #Call Method    ${chrome options}    add_argument    --disable-web-security
    #Call Method    ${chrome options}    add_argument    --disable-popup-blocking           
    #Create Webdriver    Chrome    chrome_options=${chrome options}
    #Go To    ${url}

    Open Browser    ${App.Url}    ${Selenium.Browser.Name}
    Maximize Browser Window

    Set Selenium Implicit Wait    15
    Set Selenium Timeout    45
    
    Register Keyword To Run on Failure    Capture Page Screenshot

    # next line good for recording demos
    # pause at {url} for {timeout} seconds or until page contains {text}
    #
    # otherwise comment out for normal use
    #
    #App.Pause Browser At    https://www.google.com    60s    Slalom

    App.Init

Close
    [Documentation]  Close the application
    Register Keyword To Run on Failure    Capture Page Screenshot
    App.Logout
    Close Browser

    Log    Application closed successfully.

Pause Browser At
    [Documentation]  Paused the browser at ``URL`` for ``timeout`` 
    ...              seconds until ``text`` appears on the screen
    [Arguments]    ${url}    ${timeout}    ${text}
    SeleniumLibrary.Go To    ${url}
    Wait Until Page Contains    ${text}    ${timeout}

Init
    [Documentation]  Initialize the application for the test
    # Delete All Cookies
    App.GoTo

    Log    Application initialized successfully.

GoTo
    [Documentation]  Navigate to the application home page
    ${Current.Location}=    Get Location
    Run Keyword If    '${Current.Location}'!='${App.Url}'    SeleniumLibrary.Go To    ${App.Url}
    #Sleep    5s
    Wait Until Keyword Succeeds    5x    2s    Title Should Be    ${App.PageTitle}

Login
    [Documentation]  Login to the application using the web browser
    No Operation
    Log    Keyword 'App.Logout' not implemented in ${SUITE_NAME}  WARN

Logout
    [Documentation]  Logout of the application using the web browser
    No Operation
    Log    Keyword 'App.Logout' not implemented in ${SUITE_NAME}  WARN


