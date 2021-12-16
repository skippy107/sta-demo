*** Settings ***
Documentation     Example test cases showing how to use the FakeData library
...
Library           fakedata

*** Variables ***

*** Test Cases ***
Fake Data Test
    [Documentation]    This test shows how to generate fake data
    [Tags]    fake_data
    # 
    # by keyword Get Fake Data
    ${first_name} =       Get Fake Data  first_name
    ${last_name} =        Get fake data  last_name
    # 
    # by global variable ${faker}
    ${company} =           Set Variable   ${faker.company()}
    
   
    Log     First Name is ${first_name}     WARN
    Log     Last Name is ${last_name}       WARN
    Log     Company is ${company}           WARN
    
