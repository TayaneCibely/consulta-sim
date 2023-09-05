require 'test_helper'

class ConsultaTest < ActiveSupport::TestCase
  def setup
    @paciente = Paciente.create(
      nome_completo: 'Paciente Teste',
      data_nascimento: Date.new(1990, 1, 1),
      cpf: '12345678901',
      email: 'paciente@teste.com',
      telefone: '12345678901'
    )

    @medico = Medico.create(
      nome: 'Dr. Médico Teste',
      crm: '1234567890',
      uf_crm: 'PE',
      especialidade: 'Cardiologia',
      cpf: '09876543210',
      email: 'medico@teste.com',
      inicio_consulta: '09:00',
      termino_consulta: '15:00'
    )

    @consulta = Consulta.new(
      paciente: @paciente,
      medico: @medico,
      data: Date.current,
      horario: '10:00'
    )
  end

  test 'deve ser válido' do
    assert @consulta.valid?
  end

  test 'data deve estar presente' do
    @consulta.data = nil
    assert_not @consulta.valid?
  end

  test 'horario deve estar presente' do
    @consulta.horario = nil
    assert_not @consulta.valid?
  end

  test 'data e horario válidos' do
    @consulta.data = Date.current - 1.day
    assert_not @consulta.valid?
  end

  test 'consulta ocupada' do
    consulta_existente = Consulta.create(
      paciente: @paciente,
      medico: @medico,
      data: Date.current,
      horario: '10:00'
    )

    assert_not @consulta.valid?
  end
end
