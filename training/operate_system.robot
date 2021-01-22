*** Settings ***
Documentation   http://robotframework.org/robotframework/latest/libraries/OperatingSystem.html
Library         OperatingSystem

*** Test Cases ***
example 01: creating files
    [Tags]  01
    create a arquive of text
    create a arquive json

example 02: copy files
    [Tags]  02
    copy my file

example 03: read my file
    [Tags]  03
    read the content
    read the binary
example 04: list of my files
    [Tags]  04
    list file of my directories
    delete file                     arquivo_TEXTO_COPIA.txt


*** Keywords ***
create a arquive of text
    create file             ./my_files/arquivo_TEXTO.txt    Relatory of Imune Kids

Create a arquive json
    create file             ./my_files/arquivo_JSON.json     {"teste01": "valor01", "teste02": 2, "teste03": [1, 2, 3]}

copy my file
    Copy File           ./my_files/arquivo_TEXTO.txt     ./my_files/arquivo_TEXTO_COPIA.txt
    Copy File           ./my_files/arquivo_JSON.json     ./my_files/arquivo_JSON_COPIA.json

Read the content
    ${my_file}      get file        ./my_files/arquivo_TEXTO.txt
    ${size}         get file size   ./my_files/arquivo_TEXTO.txt
    log             ${my_file}

read the binary
    should exist    ./my_files/arquivo_PDF.pdf          msg=Not found file. ALERT
    ${my_bin}       get binary file                     ./my_files/arquivo_PDF.pdf
    ${size}         get file size                       ./my_files/arquivo_PDF.pdf
    log             ${my_bin}
    log             ${size}

list file of my directories
    list directory  ./my_files

delete file
    [Arguments]     ${file}
    remove file     ./my_files/${file}