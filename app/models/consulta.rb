class Consulta < ApplicationRecord
  belongs_to :paciente
  belongs_to :medico

  validates :data, presence:true, timeliness: { on_or_after: -> { Date.current }, type: :date }
  validates :horario, presence: true, format: { with: /\A\d{2}:\d{2}\z/, message: "deve estar no formato HH:MM" }, timeliness: { on_or_after: '5:00am', on_or_before: '10:00pm', type: :time }

  private

  def data_passada
    errors.add(:date, "Data não pode ser marcada no passado") if data && data < Time.zone.today
  end

  def horario_passado
    consulta_marcada = DateTime.new(data.year, data.month, data.day, horario.hour, horario.min)
    errors.add(:date, "Horário já passou") if data && horario && consulta_marcada < Time.zone.now
  end

  def consulta_ocupada
    if medico&.consultas.exists?(date: data, time: horario)
      errors.add(:base, "Horário já ocupado por outra consulta")
    end
  end

end
