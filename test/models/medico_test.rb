require "test_helper"

class MedicoTest < ActiveSupport::TestCase
  test "criar medico corretamente" do
    medico = Medico.new(nome:"Dra Ana Maria Agreste", crm:"12433", uf_crm:"AL", cpf:"79846513208", especialidade:"Odontologia", email:"dramariaagreste@gmail.com")
    assert medico.save
  end

  test "criar um medico com crm invalido" do
    medico = Medico.new(nome:"Dr Augusto Brandao Nunes", crm:"1243", uf_crm:"PR", cpf:"32165498709", especialidade:"Psicologia", email:"draugustobrandao@gmailcom")
    assert_not medico.save
  end

  test "criar um medico com nome invalido" do
    medico = Medico.new(nome:"Dr. Jonh", crm:"55544", uf_crm:"RS", cpf:"15654243157", especialidade:"otorrinolaringologia", email:"drjohn@gmail.com")
    assert_not medico.save
  end
end