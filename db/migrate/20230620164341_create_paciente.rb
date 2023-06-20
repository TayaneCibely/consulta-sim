class CreatePaciente < ActiveRecord::Migration[7.0]
  def change
    create_table :pacientes do |t|
      t.string :nome_completo
      t.date :data_nascimento
      t.string :cpf
      t.string :email
      t.string :telefone
      t.string :password

      t.timestamps
    end
  end
end
