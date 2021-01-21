*** Settings ***
Library         DateTime
# Good for callback and asynchronous actions
Test Teardown   teardown of my test
Test Timeout    2 seconds

*** Test Cases ***
Example 01: test with timeout of test
    simulate wait of test   0.5s

Example 02: test of wait
    [Timeout]   1 minutes
    wait a keyword has sucess

*** Keywords ***

teardown of my test
    Run Keyword If Timeout Occurred  log     this test was so slow

simulate wait of test
    [Arguments]  ${time}
    Sleep        ${time}

wait a keyword has sucess
    Wait until keyword succeeds   60x   1s   This keyword only pass if we are in 15 second

This keyword only pass if we are in 15 second
    ${actual_hour}      get current date
    ${actual_hour}      convert date        ${actual_hour}      datetime
    log                 Hour actual: ${actual_hour.hour}\nMinute actual: ${actual_hour.minute}\nSecond actual: ${actual_hour.second}
    run keyword if      "${actual_hour.second}"!="15"   Fail    msg=Fail in operation