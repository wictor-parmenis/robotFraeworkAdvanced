*** Test Cases ***

Example 01: test dealing with predicted fails.
    this keyword will failed but robot ignore this
    this keyword finish execution of suite              not stop
    this keyword will fail but this is good
    this keyword will failed but robot ignore this
    # this keyword finish execution of suite              stop now

Example 02: test for continuos suite.
    No Operation

Example 03: test for continuos suite
    No Operation


*** Keywords ***
this keyword will failed but robot ignore this
    Run Keyword And Ignore Error    Should Be True  "Wictor" == "May"
    Log                             Continue test

this keyword will fail but this is good
    Run Keyword and Continue on Failure     Should Be True  "Wictor" == "May"
    Log                                     Continue test 1
    Log                                     Continue test 2
    Log                                     Continue test 3

this keyword finish execution of suite
    [Arguments]  ${stop}
    Run Keyword If      "${stop}" == "stop now"  Fatal Error  message=Stop Now !
