require_relative "../test_helper"

class MedicoTest < ActiveSupport::TestCase
  def setup
    @medico = Medico.new(
      nome: 'Dr. Exemplo de Médico',
      crm: '1234567890',
      uf_crm: 'PE',
      especialidade: 'Cardiologia',
      cpf: '12345678901',
      email: 'medico@exemplo.com',
      inicio_consulta: "09:00",
      termino_consulta: "15:00"
    )
  end

  test 'deve ser válido' do
    assert @medico.valid?
  end

  test 'nome deve estar presente' do
    @medico.nome = ''
    assert_not @medico.valid?
  end

  test 'nome deve ter pelo menos 10 caracteres' do
    @medico.nome = 'Curto'
    assert_not @medico.valid?
  end

  test 'crm deve estar presente' do
    @medico.crm = ''
    assert_not @medico.valid?
  end

  test 'crm deve ser único' do
    duplicate_medico = @medico.dup
    @medico.save
    assert_not duplicate_medico.valid?
  end
end
