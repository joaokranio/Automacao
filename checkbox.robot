*** Settings ***
Resource        base.robot

Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Variables ***
${check_thor}       id:thor
${check_iron}       css:input[Value='iron-man']
${check_panther}     xpath://*[@id='checkboxes']/input[7]

*** Test Cases ***
Marcando opção com ID 
    Go To                         ${url}/checkboxes
    Select Checkbox               ${check_thor}
    checkbox Should Be Selected   ${check_thor}
        
Marcando opção com CSS Selector
    [Tags]      ironman
    Go To                         ${url}/checkboxes
    Select Checkbox               ${check_iron}
    checkbox Should Be Selected   ${check_iron}
    
Marcando opção com xpath
     [Tags]      ironmanII
    Go To                         ${url}/checkboxes
    Select Checkbox               ${check_panther} 
    checkbox Should Be Selected   ${check_panther} 
    
