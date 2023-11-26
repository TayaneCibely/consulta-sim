# test/models/paciente_test.rb
require "test_helper"

class PacienteTest < ActiveSupport::TestCase
  test "salvar paciente corretamente" do
    paciente_params = {
      nome_completo: "Ronaldo Silva Ramos",
      cpf: "51985641346",
      data_nascimento: Date.new(1987, 4, 5),
      email: "ronaldo@gmail.com",
      telefone: "82982275410",
      endereco_attributes: {
        cep: "90000123",
        cidade: "Contagem",
        bairro: "Vargem Grande",
        logradouro: "Rua da Paz",
        complemento: "Apto 123"
      }
    }

    paciente = Paciente.new(paciente_params)
    assert paciente.save, "Falha ao salvar paciente: #{paciente.errors.full_messages.join(', ')}"
  end

  test "falhar ao salvar paciente com nome curto" do
    paciente_params = {
      nome_completo: "Maria",
      cpf: "12345678901",
      data_nascimento: Date.new(1990, 1, 15),
      email: "maria@gmail.com",
      telefone: "81987654321",
      endereco_attributes: {
        cep: "80000234",
        cidade: "Recife",
        bairro: "Boa Viagem",
        logradouro: "Avenida Principal",
        complemento: "Casa 456"
      }
    }

    paciente = Paciente.new(paciente_params)
    assert_not paciente.save
  end

  test "falhar ao salvar paciente sem endereço" do
    paciente_params = {
      nome_completo: "João da Silva", cpf: "98765432101", data_nascimento: Date.new(1985, 8, 12), email: "joaosilva@email.com", telefone: "81976543210",
      endereco_attributes: {}  # Endereço vazio
    }

    paciente = Paciente.new(paciente_params)
    assert_not paciente.save
  end
end
