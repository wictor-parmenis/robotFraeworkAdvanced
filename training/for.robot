*** Test Cases ***

case of test 1: remember the format of for
    doing a for

case of test 2: create cadaster of products
    create cadaster of products

case of test 3: create dictionary of traductions
    create dictionary of traductions

case of test 4: for with enumerate
    [Tags]  four
    for with enumerate

case of test 5: traditional for
    [Tags]  five
    traditional for

case of test 6: traditional for (2)
    [Tags]  six
    traditional for (2)

case of test 7: arithmetic for
    [Tags]  seven
    arithmetic for

case of test 8: specifics intervals
    [Tags]  eight
    specifics intervals



*** Keywords ***

doing a for
    FOR  ${animal}  IN  cat  dog  bird
        log     ${animal}
    END

# loops nested
create cadaster of products
    FOR  ${product}  IN  shirt  t-shirt  shoes
            print size of product  ${product}
    END

print size of product
    [Arguments]     ${product}
    FOR  ${size}  IN  P  M  G  GG
        log  ${product} - ${size}
    END

# Using various variables
create dictionary of traductions
    FOR  ${index}  ${english}  ${portuguese}   IN
    ...  1         cat          gato
    ...  2         dog          cachorro
    ...  3         bird         pássaro
        log to console   ${index} - ${english} - ${portuguese}
    END

# For with positioning in list
for with enumerate
    FOR  ${index}  ${item}  IN ENUMERATE  P  M  G  GG
        log to console  Item of list: ${item} - position ${index}
    END

traditional for
    FOR  ${index}  IN RANGE  1  11
        log to console  ${index}
    END

traditional for (2)
    FOR  ${index}  IN RANGE  10
        log to console  ${index}
    END

arithmetic for
    ${var}  set variable  ${5}
    FOR  ${index}  IN RANGE  ${var} + 1
        log to console  ${index}
    END

specifics intervals
    FOR  ${index}  IN RANGE  0  36  5
      log to console  ${index}
    END