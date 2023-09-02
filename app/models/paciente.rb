class Paciente < ApplicationRecord
  has_many :consultas
  has_one :endereco, through: :endereco

  accepts_nested_attributes_for :endereco, update_only: true

  validates :nome_completo, presence: true, length: { minimum: 10 }, numericality: false
  validates :data_nascimento, inclusion: { in: Date.new(1900)..Date.current }
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 }, numericality: { only_integer: true }
  validates :email, presence: true, length: { maximum: 100 }, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: true }
  validates :telefone, presence: true, length: { minimum: 9 }, numericality: { only_integer: true }
end
