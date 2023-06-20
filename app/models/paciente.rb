class Paciente < ApplicationRecord
  has_secure_password
  has_many :consultas
  accepts_nested_attributes_for :endereco, update_only: true

  validates :nome_completo, presence: true, length: { minimum: 10 }, numericality: false
  validates :data_nascimento, on_or_before: -> { Date.current }
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 }, numericality: { only_integer: true }
  validates :email, presence: true, length: { maximum: 100 }, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: true }
  validates :telefone, presence: true, length: { minimum: 9 }, numericality: { only_integer: true }
  validates :password, presence: true, length: { minimum: 6 }

end
