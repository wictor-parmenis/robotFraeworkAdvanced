*** Settings ***
Suite Teardown  control the teardown of suite
Test Teardown   control the teardown of test

*** Test Cases ***
# Sucess
Example 01: test dealing suite and test teardowns
    [Tags]  example_01
    forcing test to pass
    this keyword will automatically pass
    forcing test to fail

Example 02: test dealing suite and test teardowns
    [Tags]  example_02
    this keyword will automatically pass
    this keyword will automatically pass
    forcing test to pass with if
    this keyword will automatically pass
    this keyword will automatically pass

# Fails

Example 03: test dealing suite and test teardowns
    [Tags]  example_03
    this keyword will automatically pass
    forcing test to fail
    this keyword will automatically pass
    this keyword will automatically pass
    this keyword will automatically pass

*** Keywords ***
# Suite teardowns
control the teardown of suite
    Run Keyword If All Tests Passed  Log  all tests passed.
    Run Keyword If Any Tests Failed  Log  Some tests have failed.

# Test teardown
control the teardown of test
    run keyword if test passed  log  my test passed.
    run keyword if test failed  log  my test failed.


# Control the status
forcing test to pass
    Pass Execution  message=i am force my test to pass.
    # Stop execution of keywords bellow this test.

forcing test to fail
    Fail        msg=i am force this test to fail.

forcing test to pass with if
    ${status}           run keyword and return status  should be true  "Wictor" == "Wictor"
    log                 ${status}
    Pass Execution if   ${status}   log   message="Wictor"="Wictor". Test passed.

this keyword will automatically pass
    Should Be True      "Wictor" == "Wictor"

this keyword will automatically fail
    Should Be True      "Luana" == "Wictor"
