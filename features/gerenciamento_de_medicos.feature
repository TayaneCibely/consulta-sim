Feature: Gerenciamento de Medico
  As a Usuario do sistema
  I want to registrar, editar, remover e exibir um medico
  So that eu gerencio os medicos do consultorio

  Background:
    Given estou na pagina principal do sistema

  Scenario: Cadastrar um novo medico
    When eu clico no botao de "Cadastrar Médico" para cadastrar um novo medico
    Then eu sou redirecionado para a pagina de "medicos/new"
    Then eu preencho o formulario de registro com os dados do medico de nome: "Ronaldo Moura", crm: "1220353456", uf_crm: "DF", cpf: "15434594528", especialidade: "Neurocirurgia", email: "ronaldomoura@gmail.com", inicio_consulta: "08:30" e termino_consulta: "14:00".
    When eu clico no botao com o nome de "Salvar"
    Then eu sou redirecionado a pagina do medico "Ronaldo Moura" apos clicar no botao de "Salvar"
    And eu vejos os resuldados do gerenciamento do medico "Ronaldo Moura"

  Scenario: Editar dados do médico
    And eu clico no botão de gerenciamento "Ver Detalhes" do medico "Ronaldo Moura"
    Then eu sou redirecionado para a pagina do medico "Ronaldo Moura"
    When eu clico no botao com o nome de "Editar Médico"
    Then eu sou redirecionado para a pagina com os dados do medico "Ronaldo Moura"
    When eu atualizo os dados do medico com nome: "Ronaldo Moura Sales", crm: "1220353456", uf_crm: "DF", cpf: "15434594528", especialidade: "Ginecologia", email: "ronaldomouras@gmail.com", inicio_consulta: "09:0" e termino_consulta: "15:00".
    And eu clico no botao "Salvar"
    Then eu sou redirecionado a pagina do medico "Ronaldo Moura Sales" apos clicar no botao de "Salvar"
    And eu vejo os resultados do gerenciamento relacionados ao medico "Ronaldo Moura Sales", crm: "1220353456", uf_crm: "DF", cpf: "15434594528", especialidade: "Ginecologia", email: "ronaldomouras@gmail.com", inicio_consulta: "09:0" e termino_consulta: "15:00"


  Scenario: Remover um médico
    When eu clico no botão de gerenciamento "Ver Detalhes" do medico "Ronaldo Moura Sales"
    And eu clico no botão com o nome de "Apagar Médico"
    Then eu sou redirecionado para a pagina de gerenciamento dos medicos
    And eu vejo uma mensagem de confirmação de exclusão "Medico apagado com sucesso"
    And eu nao vejo mais no nome do medico "Ronaldo Moura Sales" na lista de medicos


