Feature: cadastrar um paciente
  As a atendente do consultorio
  I want to cadastrar um paciente
  So that eu tenho um base de paciente atualizada

  Scenario: cadastrar um paciente
    Given estou na pagina de cadastro de paciente
    When eu prencho os campos, nome_completo: 'Marcos Ribeiro', data_nascimento: '12-05-2002', cpf: '74125836902', email: 'ribeiromarcos@gmail', telefone: '929845678923', cep: '80005123', cidade: 'Alta Mira', bairro: 'Novo Mundo', logradouro: 'Avenida da Liberdade', complemento: 'Casa 16'
    And clico em salvar
    Then Eu vejo a pagina do Paciente 'Marcos Ribeiro'

  Scenario: cadastrar um paciente sem o cpf
    Given estou na pagina de cadastrar um novo paciente
    When eu prencho os campos do paciente, nome_completo: 'Maria Augusta', data_nascimento: '26-11-1980', email: 'mariaaugusto@gmail', telefone: '879887654123', cep: '9000500', cidade: 'Maragogi', bairro: 'Alamenda', logradouro: 'Rua das Campinas', complemento: 'Apto 69'
    And clico em salvar
    Then eu vejo uma mensagem de erro na tela