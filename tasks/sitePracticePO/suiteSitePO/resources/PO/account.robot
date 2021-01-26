*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${account_title}    //*[@id="center_column"]/h1

*** Keywords ***
verifique se a conta foi criada
    wait until element is visible   ${account_title}
