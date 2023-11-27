Feature: cadastrar um medico
  As a atendente do consultorio
  I want to cadastrar um medico
  So that eu tenha uma lista de medicos atualizada

  Scenario: cadastrar um medico
    Given estou na tela de criar Medico
    When eu preencho os campos, nome: 'Dr Agenor Lopes', crm: '55648', uf_crm: 'MT', cpf:'54688747921', especialidade: 'Geriatria', email: 'dragenorlopes@gmail.com', inicio_consulta: '08:00', termino_consulta: '12:00'
    And clico em salvar
    Then Eu vejo a pagina do Medico 'Dr Agenor Lopes'

  Scenario: cadastrar um medico com nome invalido
    Given estou na pagina de cadastrar medico
    When eu preencho os campos sem nome, crm: '22369', uf_crm: 'AL', cpf: '36987452147', especialidade: 'Ortopedia', email: 'examplemedico@gmail.com', inicio_consulta:'06:00', termino_consulta: '11:00'
    And clico salvar
    Then eu vejo uma mensagem de erro

