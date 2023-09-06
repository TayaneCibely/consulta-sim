Feature: Busca de paciente
  As a Usuario do sistema
  I want to buscar um paciente informando o seu nome ou CPF
  So that eu visualize o paciente desejado

  Background:
    Given estou na pagina principal do sistema
    Given Existe o Paciente de nome "Erik Brasil", cpf: "12312312311", email: "erickbr@email.com" e Numero de telefone: "11111111117" no sistema
    And eu estou na pagina de busca de pacientes

  Scenario: Pesquisar e visualizar detalhes do paciente
    When eu pesquiso por "Erik Brasil" no campo "query" de paciente
    And eu clico no botao escrito "Buscar"
    And eu vejo o link com o nome de "Ver detalhes"
    Then eu sou redirecionado para a pagina do paciente "Erik Brasil" ao clicar no botao de Ver detalhes
    And vejo as informacoes do paciente "Erik Brasil"

  Scenario: Busca sem resultados
    When eu pesquiso por um nome de paciente que nao existe no sistema no campo "query" de paciente
    And eu clico no botao escrito "Buscar"
    Then eu vejo a mensagem "Nenhum paciente encontrado" na nova tela de pacientes

  Scenario: Busca por CPF
    When eu pesquiso pelo cpf "12312312311" no campo "query" de paciente
    And eu clico no botao escrito "Buscar"
    Then eu vejo resultados relacionados ao paciente "Erik Brasil"
    And vejo o link com o nome de "Ver detalhes"
    Then eu sou redirecionado para a pagina do paciente "Erik Brasil" ao clicar no botao de "Ver detalhes" na busca por cpf
    And vejo as informacoes do paciente "Erik Brasil"

  Scenario: Busca com letras maiusculas e minusculas misturadas
    When eu pesquiso por "eRiK bRaSiL" no campo "query" de paciente
    And eu clico no botao escrito "Buscar"
    Then eu vejo resultados relacionados ao paciente "Erik Brasil"
    And vejo o link com o nome de "Ver detalhes"
    Then eu sou redirecionado para a pagina do paciente "Erik Brasil" ao clicar no botao de Ver detalhes
    And vejo as informacoes do paciente "Erik Brasil"

  Scenario: Busca por parte do nome
    When eu pesquiso por "Erik" no campo "query" de paciente
    And eu clico no botao escrito "Buscar"
    Then eu vejo resultados relacionados ao paciente "Erik Brasil"
    And vejo o link com o nome de "Ver detalhes"
    Then eu sou redirecionado para a pagina do paciente "Erik Brasil" ao clicar no botao de Ver detalhes
    And vejo as informacoes do paciente "Erik Brasil"




