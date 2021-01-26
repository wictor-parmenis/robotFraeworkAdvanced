*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
&{CADASTER_FIELDS}   firstname=Wictor    lastname=Gomes  password=12345678     address1=Street 01, Nº 34   city=Paulista   postcode=00000  phone_mobile=81 991021317   alias=Next at Church Assembléia

${cadaster_gender}          //*[@id="id_gender1"][@name="id_gender"][@value="1"]
${cadaster_first_name}      //*[@id="customer_firstname"]
${cadaster_last_name}       //*[@id="customer_lastname"]
${cadaster_email}           //*[@id="email"]
${cadaster_pwd}             //*[@id="passwd"]
${cadaster_days}            //*[@id="days"]
${cadaster_firstname}       //*[@id="firstname"]
${cadaster_lastname}        //*[@id="lastname"]
${cadaster_company}         //*[@id="company"]
${cadaster_address1}        //*[@id="address1"]
${cadaster_address2}        //*[@id="address2"]
${cadaster_city}            //*[@id="city"]
${cadaster_post_code}       //*[@id="postcode"]
${cadaster_id_state}        id=uniform-id_state
${cadaster_other}           //*[@id="other"]
${cadaster_phone}           //*[@id="phone"]
${cadaster_mobile}          //*[@id="phone_mobile"]
${cadaster_alias}           //*[@id="alias"]
${cadaster_name_state}      name=id_state

# buttons
${cadaster_btn_submitCreate}    //*[@id="SubmitCreate"]
${cadaster_btn_submitAccount}   //*[@id="submitAccount"]


*** Keywords ***
#### Ações
Novo email
    [Arguments]         ${NOME}     ${SOBRENOME}
    ${RANDOM_STRING}    Generate Random String
    ${CUSTOM_EMAIL}     Set Variable    ${NOME}${SOBRENOME}${RANDOM_STRING}@email.com
    [Return]            ${CUSTOM_EMAIL}

Informar um e-mail válido
    ${NEW_EMAIL}                    Novo email  ${CADASTER_FIELDS.firstname}  ${CADASTER_FIELDS.lastname}
    Input Text                      name=email_create      ${NEW_EMAIL}

Clicar no botão "Create na account"
    Click Button                    ${cadaster_btn_submitCreate}
    wait until element is visible   ${cadaster_gender}  10s
    wait until element is visible   ${cadaster_first_name}  10s
    wait until element is visible   ${cadaster_last_name}   10s
    wait until element is visible   ${cadaster_email}   10s
    wait until element is visible   ${cadaster_pwd}  10s
    wait until element is visible   ${cadaster_days}  10s
    wait until element is visible   ${cadaster_firstname}  10s
    wait until element is visible   ${cadaster_lastname}  10s
    wait until element is visible   ${cadaster_company}  10s
    wait until element is visible   ${cadaster_address1}  10s
    wait until element is visible   ${cadaster_address2}  10s
    wait until element is visible   ${cadaster_city}  10s
    # wait until element is visible   //*[@id="id_country"][@name="id_country"]  10s
    wait until element is visible   ${cadaster_post_code}  10s
    wait until element is visible   ${cadaster_id_state}  10s
    wait until element is visible   ${cadaster_other}  10s
    wait until element is visible   ${cadaster_phone}  10s
    wait until element is visible   ${cadaster_mobile}  10s
    wait until element is visible   ${cadaster_alias}  10s
    wait until element is visible   ${cadaster_btn_submitAccount}   10s

Preencher os campos obrigatórios
    Input Text              ${cadaster_first_name}   ${CADASTER_FIELDS.firstname}
    Input Text              ${cadaster_last_name}    ${CADASTER_FIELDS.lastname}
    Input Text              ${cadaster_pwd}               ${CADASTER_FIELDS.password}
    Input Text              ${cadaster_firstname}            ${CADASTER_FIELDS.firstname}
    Input Text              ${cadaster_lastname}             ${CADASTER_FIELDS.lastname}
    Input Text              ${cadaster_address1}             ${CADASTER_FIELDS.address1}
    Input Text              ${cadaster_city}                 ${CADASTER_FIELDS.city}
    Input Text              ${cadaster_post_code}             ${CADASTER_FIELDS.postcode}
    Input Text              ${cadaster_mobile}         ${CADASTER_FIELDS.phone_mobile}
    Input Text              ${cadaster_alias}                ${CADASTER_FIELDS.alias}
    Click Element           ${cadaster_name_state}
    Press Keys              ${cadaster_name_state}   ARROW_DOWN
    Press Keys              ${cadaster_name_state}   RETURN

Clicar em "Register"para finalizar o cadastro
    Click Button                    ${cadaster_btn_submitAccount}
