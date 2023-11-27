Feature: cadastrar um paciente
  As a atendente do consultorio
  I want to cadastrar um paciente
  So that eu tenho um base de paciente atualizada

  Scenario: cadastrar um paciente
    Given estou na pagina principal
    And clico no link para cadastrar um novo paciente
    When eu prencho os campos, nome_completo: 'Marcos Ribeiro', data_nascimento: '12-05-2002', cpf: '74125836902', email: 'ribeiromarcos@gmail', telefone: '929845678923', cep: '80005123', cidade: 'Alta Mira', bairro: 'Novo Mundo', logradouro: 'Avenida da Liberdade', complemento: 'Casa 16'
    And clico em Criar Paciente
    Then eu vejo a confirmacao paciente cadastrado com sucesso

  Scenario: tentar cadastrar um paciente com os campos em branco
    Given eu estou na pagina principal
    And  clico em cadastrar um novo paciente
    When clio um paciente de nome_completo: '', data_nascimento: '', cpf: '', email: '', telefone: '', email: '', telefone: '', cep:'', cidade: '', bairro: '', logradouro: '', complemento: ''
    And clico em Criar paciente
    Then eu vejo a mensagem 'Nome completo can't be blank'