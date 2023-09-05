require '../test_helper'

class PacienteTest < ActiveSupport::TestCase
  def setup
    @paciente = Paciente.new(
      nome_completo: 'Exemplo de Paciente',
      data_nascimeto: Date.new(1998, 1, 2),
      cpf: '12345678902',
      email: 'paciente@exemplo.com',
      telefone: '01987654321',
      endereco_attributes: { cep: '55341000',
      cidade: 'Petrolina',
      bairro: 'Centro',
      logradouro: 'Rua São João',
      complemento: 'apartamento'
      }
    )
  end

  test 'deve ser válido' do
    assert @paciente.valid?
  end

  test 'nome_completo deve estar presente' do
    @paciente.nome_completo = ''
    assert_not @paciente.valid?
  end

  test 'data_nascimento deve estar presente' do
    @paciente.data_nascimento = nil
    assert_not @paciente.valid?
  end

  test 'cpf deve ser único' do
    duplicate_paciente = @paciente.dup
    @paciente.save
    assert_not duplicate_paciente.valid?
  end

  test 'email deve estar em um formato válido' do
    @paciente.email = 'email.invalido'
    assert_not @paciente.valid?
  end

  test 'telefone deve conter apenas dígitos numéricos' do
    @paciente.telefone = '12345abc678'
    assert_not @paciente.valid?
  end
end