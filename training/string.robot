*** Settings ***
Documentation   http://robotframework.org/robotframework/latest/libraries/String.html
Library         String
Library         OperatingSystem

*** Test Cases ***

example 01: lines of a text
    [Tags]  01
    couting the lines
    getting a specific line
    getting a specific line with word x  linha 01
    get with highlighter

example 02: treating strings
    [Tags]  02
    replace values in text
    i want change all


*** Keywords ***
new get file
    ${content_file}     get file    ./my_files/arquivo_texto_linhas.txt
    [Return]            ${content_file}

couting the lines
    ${string}   new get file
    ${lines}    get line count  ${string}
    Log         My file has: ${lines} lines

getting a specific line
    ${string}   new get file
    ${line_3}   get line    ${string}   3
    Log         Content of line 3: ${line_3}
    FOR  ${number_line}  IN RANGE   0  6
        ${content_line}     get line    ${string}   ${number_line}
        log     The content of line ${number_line}: ${content_line}
    END

getting a specific line with word x
    [Arguments]     ${word}
    ${string}       new get file
    ${line}         get lines containing string     ${string}   ${word}
    Log             Line with ${word}: \n${line}

get with highlighter
    ${string}   new get file
    ${line}     get line                     ${string}   0
    ${begin}    fetch from left         ${line}     0
    ${end}      fetch from right        ${line}     linha${SPACE}
    Log         Begin: "${begin}" \nEnd: "${end}" \n\nAll together: "${begin}${end}"

replace values in text
    ${text}             new get file
    ${new_text}         replace string  string=${text}  search_for=Minha linha  replace_with=Conteúdo da minha linha
    log                 The old text was like that: ${text}\n The new text is that: ${new_text}\n
    create file         ./my_files/meu_novo_arquivo.txt      ${new_text}

i want change all
    ${text}             new get file
    ${text_lower}       convert to lower case     ${text}
    ${text_upper}       convert to upper case     ${text}
    log                 Text in uppercase: ${text_upper}\n Text in lowercase: ${text_lower}\n
