class Consulta < ApplicationRecord
  self.table_name = 'consultas'

  belongs_to :paciente
  belongs_to :medico

  validates :data, presence: true
  validates :horario, presence: true

  validate :data_e_horario_valido

  private

  def data_e_horario_valido
    return unless data.present? && horario.present?

    consulta_marcada = DateTime.new(data.year, data.month, data.day, horario.hour, horario.min)
    if consulta_marcada < Time.zone.now
      errors.add(:base, "Horário já passou ou Data já passaram")
    end
  end

end
