# test/models/consulta_test.rb
require 'test_helper'

class ConsultaTest < ActiveSupport::TestCase
  test "criar consulta medica corretamente" do
    #cria um paciente
    paciente_params = { nome_completo:"Claudia Maria Alves", cpf:"87456912554", data_nascimento: Date.new(1998, 11, 6), email:"claudiamaria@gmail.com", telefone:"87987564125", endereco_attributes: {
        cep: "54000987",
        cidade: "Lagoa Grande",
        bairro: "Centro",
        logradouro: "Rua do Albergue",
        complemento: "casa 8"
      }
    }
    paciente = Paciente.new(paciente_params)

    assert paciente.save()

    #Cria um médico
    medico = Medico.new(nome:"Dr Pedro Araujo Leite", crm:"56897", uf_crm:"PE", cpf:"78743496687",especialidade:"Cirurgia", email:"pedroleitedr@gmail.com")
    assert medico.save()

    consulta = Consulta.create(paciente_id:paciente.id, medico_id:medico.id, data: Date.new(2023, 12, 1), horario: '12:00')

    assert consulta.save(), "Falha ao criar consulta: #{consulta.errors.full_messages.join(', ')}"

  end

  test "falhar ao criar uma consulta com data no passado" do

    #cria um paciente
    paciente_params = { nome_completo: "Natalia test", cpf: "0987654354323", data_nascimento: Date.new(200, 5, 3), email: "nataliatestexemaple@gmail.com", telefone:"789846985125", endereco_attributes: {
      cep:"98000546",
      cidade: "Pato Blanco",
      bairro: "Horizonte",
      logradouro: "Rua do Sol",
      complemento: "apt 24"
    }}
    paciente = Paciente.new(paciente_params)
    assert paciente.save

    #cria um médico
    medico = Medico.new(nome: "Dra Carla Almeida Alencar", crm:"87500", uf_crm:"SE", cpf:"54786912340", especialidade: "Oncologia", email: "dracarlaalmeida@gmail.com")
    assert medico.save()

    consulta = Consulta.create(paciente_id: paciente.id, medico_id: medico.id, data: Date.new(2023, 10, 1), horario: '12:00')
    assert_not consulta.save()
  end
end
