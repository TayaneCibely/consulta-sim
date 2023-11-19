Feature: Medico
  As a medico
  I want to adicionar, remover, visualizar e editar meu cadastro
  So that eu nao tenha que fazer isso de forma manual ou presencial


  Scenario:  remover medico
    Given estou na pagina de medico
    And o medico com CRM '11223' existe
    When eu clico em remover o medico com CRM '11223'
    Then eu vejo uma mensagem que o medico foi apagado com sucesso