class Endereco < ApplicationRecord
  belongs_to :paciente

  validates :cep, presence: true, length: { is: 5 }, numericality: { only_integer: true }
  validates :cidade, presence: true, length: { minimum: 3 }, numericality: false
  validates :bairro, presence: true, length: { minimum: 5 }
  validates :logradouro, presence: true, length: { maximum: 10 }
  validates :complemento, presence: true, length: { minimum: 5 }
end
