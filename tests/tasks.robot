*** Settings ***
Documentation    Suite de testes do cadastro de tarefas

Resource    ${EXECDIR}/resources/base.resource

Test Setup       Start session
Test Teardown    Finish session

*** Test Cases ***
Deve poder cadastrar uma nova tarefa
    [Tags]    Cria tarefa

    ${tarefa}    Set Variable    Estudar para certificação CTFL
    Remove tarefa do banco de dados    ${tarefa}

    Fazer login
    Criar nova task        ${tarefa}
    Deve conter o texto    ${tarefa}

    Sleep        5

Deve poder remover tarefa indesejada
    [Tags]    remove tarefa

    ${tarefa}    Set Variable    Estudar para certificação CTFL
    Remove tarefa do banco de dados    ${tarefa}

    Fazer login
    Criar nova task        ${tarefa}
    Deve conter o texto    ${tarefa}

    Remover tarefa pelo nome    ${tarefa}
    Wait Until Page Does Not Contain    ${tarefa}

Deve poder concluir uma tarefa
    [Tags]    concluir tarefa

    ${tarefa}    Set Variable    Estudar para certificação CTFL
    Remove tarefa do banco de dados    ${tarefa}

    Fazer login
    Criar nova task        ${tarefa}
    Deve conter o texto    ${tarefa}

    Finalizar tarefa    ${tarefa}
    Tarefa deve estar finalizada    ${tarefa}


