class AddPacienteToConsulta < ActiveRecord::Migration[7.0]
  def change
    add_reference :consulta, :paciente, foreign_keys: true
  end
end
