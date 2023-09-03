json.extract! medico, :id, :nome_medico, :crm, :uf_crm, :cpf, :especialidade, :email, :inicio_consulta, :termino_consulta, :created_at, :updated_at
json.url medico.url(medico, format: :json)