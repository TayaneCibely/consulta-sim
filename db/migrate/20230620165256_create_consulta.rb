class CreateConsulta < ActiveRecord::Migration[7.0]
  def change
    create_table :consulta do |t|
      t.string :nome_medico
      t.date :data
      t.datetime :horario

      t.timestamps
    end
  end
end
