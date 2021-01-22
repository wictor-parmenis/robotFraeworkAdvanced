*** Settings ***
Documentation   http://robotframework.org/robotframework/latest/libraries/DateTime.html
Library         DateTime

*** Test Cases ***

example 01: getting current date and hours
    test get actual date
    test getting actual date and hour
    test getting day, month an year separately

example 02: working with time
    [Tags]  ex_02
    working with time

example 03: calcs with dates
    [Tags]  ex_03
    add time of date
    subtract time of date


*** Keywords ***
test get actual date
    ${now}               Get Current Date   result_format=%d-%m-%y
    Log                  ${now}

test getting actual date and hour
    ${now}          Get Current Date        result_format=%d-%m-%Y %H:%M:%S
    Log             ${now}

test getting day, month an year separately
    ${today}    Get Current Date
    ${today}    Convert Date        ${today}    datetime
    Log         ${today.day}-${today.month}-${today.year}

working with time
    ${hour}     Convert Time        1 minute 30 seconds
    Log         Are ${hour} seconds in 1 minute and 30 seconds.
    ${hour}     convert time    5400    verbose
    log         5400 seconds = ${hour}
    ${hour}     convert time    5500    timer   exclude_millis=yes
    log         5500 seconds is ${hour}

add time of date
    ${before}   get current date
    ${after}    add time to date    ${before}   4 hours     result_format=%d-%m-%Y %H-%M-%S
    log         Before: ${before} | After: ${after}
    ${before}   get current date
    ${after}    add time to date    ${before}   10 days      result_format=%d-%m-%Y %H-%M-%S
    log         Before: ${before} | After: ${after}

subtract time of date
    ${before}   get current date
    ${after}    subtract time from date    ${before}   4 hours     result_format=%d-%m-%Y %H-%M-%S
    log         Before: ${before} | After: ${after}
    ${before}   get current date
    ${after}    subtract time from date    ${before}   10 days      result_format=%d-%m-%Y %H-%M-%S
    log         Before: ${before} | After: ${after}
