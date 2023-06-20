class AddMedicoToConsulta < ActiveRecord::Migration[7.0]
  def change
    add_reference :consulta, :medico, foreign_keys: true
  end
end
