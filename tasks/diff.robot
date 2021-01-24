*** Settings ***
Library         DiffLibrary
Documentation   https://marketsquare.github.io/robotframework-difflibrary/

*** Variables ***
${path}    ${CURDIR}${/}my_files

*** Test Cases ***
test: files diference
    files diference

*** Keywords ***
files diference
    diff files  ${CURDIR}/hoje.txt  /hojeCopy.txt
