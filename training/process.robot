*** Settings ***
Documentation   http://robotframework.org/robotframework/latest/libraries/Process.html
Library         Process

*** Test Cases ***

example 01: open and close programs
    open end close the notepad

example 02: run and wait scripts
    [Tags]  02
    run script and wait this execute with success
    run script and wait this execute with fail

example 03: execute much command in prompt
    [Tags]  03
    execute much command in prompt


*** Keywords ***
open end close the notepad
    ${my_process}   Start Process  C:\\WINDOWS\\system32\\notepad.exe
    sleep  3s
    terminate process   ${my_process}   kill=True

checking success in execution of script
    [Arguments]  ${my_process}
    run keyword and continue on failure     should be equal as integers     ${my_process.rc}    0
    ...                                     msg=YOUR PROCESS NOT RUN WITH SUCCESS
    run keyword if                          ${my_process}=!0  Log     Fail ocurred: "${my_process.stderr}"


run script and wait this execute with success
    ${my_process}   run process     python  hello_world.py
    Log    Resultado da execução (sucesso/falha): ${my_process.rc}
    Log    Saída da execução: ${my_process.stdout}
    checking success in execution of script      ${my_process}

run script and wait this execute with fail
    ${my_process}   run process     python  hello_world.py
    Log    Resultado da execução (sucesso/falha): ${my_process.rc}
    Log    Saída da execução: ${my_process.stdout}
    Log    Falha da execução: ${my_process.stderr}
    checking success in execution of script      ${my_process}

execute much command in prompt
    run process     mkdir imunekids_test    cwd=${CURDIR}   shell=True


