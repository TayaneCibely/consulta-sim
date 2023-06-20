class Consulta < ApplicationRecord
  belongs_to :paciente
  belongs_to :medico

  validates :nome_medico, presence:true, uniqueness: true
  validates :data, presence:true, timeliness: { on_or_after: -> { Date.current }, type: :date }
  validates :horario, presence: true, format: { with: /\A\d{2}:\d{2}\z/, message: "deve estar no formato HH:MM" }, timeliness: { on_or_after: '5:00am', on_or_before: '10:00pm', type: :time }
end
