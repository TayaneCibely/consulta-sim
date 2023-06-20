class Medico < ApplicationRecord
  has_secure_password
  has_many: consulta
  has_one: endereco
  accepts_nested_attributes_for :endereco, update_only: true



end
