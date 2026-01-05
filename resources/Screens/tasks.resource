*** Settings ***
Documentation        Elementos e ações da tela minhas tarefas

Library        AppiumLibrary

*** Variables ***
${new_task_input}    xpath=//*[contains(@text, "nova tarefa")]
${create_button}     xpath=//*[@resource-id="createTask"]

*** Keywords ***
Criar nova task
    [Arguments]    ${task_name}
    
    Wait Until Element Is Visible    ${new_task_input}    5

    Input Text        ${new_task_input}    ${task_name}
    Click Element     ${create_button}

Deve conter o texto
    [Arguments]    ${task_name}

    Wait Until Element Is Visible    xpath=//*[resources-id="taskText"][@text="${task_name}"]    10

Remover tarefa pelo nome
    [Arguments]    ${task_name}

    Click Element    //*[@text="${task_name}"]/../..//*[@resource-id="removeTask"]

    ${yes_button}    Set Variable    xpath=//android.widget[@text='SIM"]

    Wait Until Element Is Visible    ${yes_button}    5
    Click Element                    ${yes_button}

Finalizar tarefa
    [Arguments]    ${task_name}

    Click Element    xpath=//*[@text="${task_name}"]

Tarefa deve estar finalizada
    [Arguments]    ${task_name}

    Wait Until Element Is Visible    xpath=//*[@text="${task_name}"]/..//android.widget.ImageView