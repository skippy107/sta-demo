*** Settings ***

Resource    settings/All.Settings.txt                 #  suite specific variables defined here
Resource    imports/example.imports.txt                #  imports the required objects 


Test Teardown    Test Cleanup

Suite Setup       App.Open
Suite Teardown    App.Close

Documentation    *Example Tests*
...    
...    This test suite consists of UI tests written in Given/When/Then syntax
...    
...    Example: Activate New Patient
...
...    As a CCR
...    I need to activate the patient in the system
...    So that they are successfully registered in the system
...    And can take their survey
...    

*** Variables ***
# ${UserID}    John Smith


*** Keywords ***


Activate New Patient
    Given I am signed in as a CCR
    When I begin the activate patient process
    Then I can provide a reason for activation

#################################################################################
Test Cleanup
    Capture Page Screenshot
    Run Keyword and Ignore Error    App.Logout
    # App.Init

#################################################################################

# The custom keywords represent the implementation of
# the Business Rules.  The custom keywords defined above are called by the 
# test cases below, each one testing the boundaries of a specific Business Rule
#
# Note how the custom keyword uses a behavior driven style and the
# test case uses a data driven style

  
| *Test Cases*                                        | *Run Keywd*           |
| Activate patient                                    | Activate New Patient  |




