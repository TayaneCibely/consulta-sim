Feature: Gerenciamento de Consultas
  As a Usuario do sistema
  I want to marcar, desmarcar e editar uma consulta
  So that eu gerencie as consultas do consultorio

  Background:
    Given estou na pagina inicial
    And Existe o Paciente de nome "Branco Branco", cpf: "27271272727", email: "branco27@email.com" e Numero de telefone: "272727272727" no sistema para as consultas
    And Existe o Medico de nome "Dr Drauzio Martela" com especialidade "Odontologia" no sistema
    Given que existe uma consulta marcada para o paciente "Branco Branco", dentista "Dr Drauzio Martela", data "2023-08-30" e horario "15:00"

  Scenario: Marcar uma consulta
    When eu estou na pagina de marcacao de consulta
    And eu seleciono o paciente "Branco Branco" da lista
    And eu seleciono o dentista "Dr Drauzio Martela" da lista
    And eu preencho a data "2023-08-25" e horario "14:00" para a consulta
    And eu clico no botao de marcar consulta "Agendar Consulta"
    Then eu sou redirecionado para a pagina da consulta
    Then eu vejo os dados da ultima consulta criada


  Scenario: Tentar marcar uma consulta com data passada
    When eu estou na pagina de marcacao de consulta
    And eu seleciono o paciente "Branco Branco" da lista
    And eu seleciono o dentista "Dr Drauzio Martela" da lista
    And eu preencho a data "2023-03-01" e horario "10:00" para a consulta
    And eu clico no botao de marcar consulta "Agendar Consulta"
    Then eu vejo a mensagem de erro "Date nao pode ser marcada no passado"

  Scenario: Desmarcar uma consulta
    When eu estou na pagina de visualizar consultas
    And eu clico no botao de "Detalhes do Agendamento" para a consulta do paciente "Branco Branco" e dentista "Dr Drauzio Martela"
    And eu clico no botao de "Remover Consulta" para remover a consulta
    Then eu sou redirecionado para a pagina das consultas
    And eu nao vejo mais os detalhes da consulta na pagina que foi marcada com "Branco Branco" e o dentista "Dr Drauzio Martela" na data "2023-08-30" e horario "15:00"
