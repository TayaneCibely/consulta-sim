class AddCpfToPaciente < ActiveRecord::Migration[7.0]
  def change
    add_column :pacientes, :cpf, :string
  end
end
