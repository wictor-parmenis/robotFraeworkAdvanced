*** Settings ***
Library     ./my_libraries/valueDolar.py

*** Variables ***


*** Test Cases ***
test case 01: dollar today
    checking the price of dollar

test case 02: dollar cannadian
    checking the price of dollar cannadian

*** Keywords ***

checking the price of dollar
    ${dollar}         today dollar
    ${dollar}         set global variable  ${dollar}

checking the price of dollar cannadian
    ${dollar_c}   dollar cannadian
    Log           ${dollar_c}