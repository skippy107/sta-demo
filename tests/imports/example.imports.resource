*** Settings ***

Resource    ../objects/App.resource
Resource    ../objects/Activation.resource


Documentation    Import file for functional CCR Tests 
...
...    This file maps high level /When/Then keywords to object resources.  
...
...    The object resource files contain the implementation details for the
...    different test methods of each object.
...

*** Keywords ***
I am signed in as a CCR
    App.Login

I begin the activate patient process
    Activation.Begin

I can provide a reason for activation
    Activation.Enter Reason