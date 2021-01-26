*** Settings ***
Resource            ../resources/Resource.robot
Resource            ../resources/PO/Home.robot
Resource            ../resources/PO/Carrinho.robot
Resource            ../resources/PO/cadaster.robot
Resource            ../resources/PO/account.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Case ***
Caso de Teste com PO 01: Remover Produtos do Carrinho
    Home.Acessar a página home do site
    Home.Adicionar o produto "t-shirt" no carrinho
    Carrinho.Excluir o produto do carrinho
    Carrinho.Conferir se o carrinho fica vazio

### EXERCÍCIO
# Note: all time if execute the keyword "Open browser" with firefox, the first execution
# ocurred error of timeout.
# What solution? increase the timeout.

Caso de Teste com PO 02: Adicionar Cliente
     [Tags]     exercise
     Home.Acessar a página home do site
     Home.Clicar no botão superior direito “Sign in”
     Cadaster.Informar um e-mail válido
     Cadaster.Clicar no botão "Create na account"
     Cadaster.Preencher os campos obrigatórios
     Cadaster.Clicar em "Register"para finalizar o cadastro
     account.verifique se a conta foi criada
