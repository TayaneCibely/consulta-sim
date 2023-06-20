class Medico < ApplicationRecord
  has_secure_password
  has_many :consultas

  validates :nome, presence: true, length: { minimum: 10 }, numericality: false
  validates :crm, presence: true, uniqueness: true, format: { with: /\A\d+\z/ }
  validates :uf_crm, presence: true, inclusion: { in: %w[AC AL AP AM BA CE DF ES GO MA MT MS MG PA PB PR PE PI RJ RN RS RO RR SC SP SE TO], message: "UF inválida" }
  validates :especialidade, presence: true, length: { minimum: 5 }, numericality: false
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 }, numericality: { only_integer: true }
  validates :email, presence: true, length: { maximum: 100 }, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: true }
  validates :password, presence: true, length: { minimum: 6 }

end
