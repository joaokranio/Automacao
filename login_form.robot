*** Settings ***
Resource                           base.robot
Test Setup                         Nova sessão
Test Teardown                      Encerra sessão

*** Test Cases ***
Login com Sucesso
    Go To                          ${url}/login
    Login With                     stark   jarvis!
    Should See Logged username     Tony Stark

Senha invalida
    [tags]                         login_error
    Go To                          ${url}/login
    Login With                     stark   ja
    ${message}=                    Get WebElement      id:flash
    Should Contain Login Alert     Senha é invalida!
usuário não exist
    [tags]                         login_user404
    Go To                          ${url}/login
    Login With                     JK   ja
    ${message}=                    Get WebElement      id:flash
    Should Contain Login Alert     O usuário informado não está cadastrado!

*** Keywords ***
Login With
    [Arguments]                    ${uneme}       ${pass}
    Input text                     css:input[name=username]        ${uneme} 
    Input text                     css:input[name=password]        ${pass}
    Click Element                  class:btn-login

Should Contain Login Alert
    [Arguments]                    ${expect_message}

    ${message}=                    Get WebElement      id:flash
    Should Contain                 ${message.text}     ${expect_message}

Should See Logged username
    [Arguments]                    Olá, ${full_mane}. Você acessou a área logada!