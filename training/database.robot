*** Settings ***
Library         DatabaseLibrary
Test Setup      connect with BD
Test Teardown   disconnect of BD

*** Test Cases ***

test 01: execute scripts sql for arquives
    [Tags]  01
    execute script for arquive in DB        ${CURDIR}/mySql_scripts/create_table.sql
    execute script for arquive in DB        ${CURDIR}/mySql_scripts/insert_into.sql
    check if data was insert with success   Joao Gomes

test 02: execute script for strings
    [Tags]  02
    execute script for string               INSERT INTO public.account(user_id, username, password, email) VALUES (99, 'Luiz Silva', 'robot987', 'robotizando2@robot.com')
    check if data was insert with success   Luiz Silva

test 03: select statement
    [Tags]  03
    ${answer}   execute query in bd     SELECT * FROM account
    Log         ${answer}
    Log         User - ${answer[7][0]} | Name - ${answer[7][1]} | Email - ${answer[7][3]}

test 04: drop table
    [Tags]     04
    clean table                 account
    execute script for string   DROP TABLE account

*** Keywords ***
connect with BD
    connect to database     dbapiModuleName=psycopg2    dbName=robot    dbUsername=postgres
    ...                     dbPassword=postgres     dbHost=localhost    dbPort=5432

disconnect of BD
    disconnect from database

execute script for arquive in DB
    [Arguments]  ${script}
    execute sql script      sqlScriptFileName=${script}

check if data was insert with success
    [Arguments]  ${data}
    log                             ${data}
    Check If Exists In Database    selectStatement=SELECT username FROM account WHERE username = '${data}'

execute script for string
    [Arguments]  ${script}
    execute sql string  sqlString=${script}

execute query in bd
    [Arguments]         ${query}
    ${RESPONSE_QUERY}   query   selectStatement=${query}
    [Return]            ${RESPONSE_QUERY}

clean table
    [Arguments]     ${table}
    ${register}     row count   selectStatement=SELECT * FROM ${table}
    run keyword if  ${register} > 0     delete all rows from table  ${table}