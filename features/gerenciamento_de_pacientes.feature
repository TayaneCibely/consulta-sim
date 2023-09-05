Feature: Gerenciamento de Paciente
  As a Usuario do sistema
  I want to cadastrar, editar, remover e exibir um paciente
  So that eu gerencio os pacientes do consultorio

  Scenario: Cadastrar um novo paciente
    When eu clico no botao "Cadastrar Paciente" para cadastrar um novo paciente
    Then e eu sou direcionado para a pagina de gerenciamento de pacientes "pacientes/new"
    Then eu preecho o formulario de registro com os dados do paciente nome do paciente: "Caio Silva", cpf: "12345678901", data de nascimento: "1994/June/23",telefone: "819877522602", email: "caiosilva@gmail.com"
    And eu preecho o furmulario com os dados de endereco cep: "55340100", cidade: "Porto", bairro: "Centro", logradouro: "Rua da Praia", complemento: "Apartamento"
    And eu clico no botao de escrito escrito "Salvar" para salvar os dados do paciente
    Then eu sou redirecionado para a pagina do paciente "Caio Silva"
    And  eu vejo os detalhes do paciente "Caio Silva" exibidos na pagina

   Scenario: Editar informacoes do paciente
     When eu clico no botao de gerenciamento "Detalhes do Paciente" do paciente "Caio Silva"
     Then eu sou direcionado a pagina de detalhes do paciente "Caio Silva"
     And eu clico no botao com o nome "Editar dados" para editar os dados do paciente
     Then eu sou redirecionado a para a pagina de edicao dos dados do paciente "Caio Silva"
     When eu atualizo os dados do paciente com nome: "Caio Henrique Silva", cpf: "12345678902", data de nascimento: "1994/July/23"
     And eu clico no botao "Salvar" para salvar os dados do paciente

    Scenario: Exibir detalhes do paciente
      When eu clico no botao de gerenciamento "Ver detalhes" do paciente "Caio Henrique Silva"
      Then eu sou redirecionado para a pagina do paciente "Caio Henrique Silva"
      And eu vejo os detalhes do paciente "Caio Henrique Silva" exibidos na pagina

