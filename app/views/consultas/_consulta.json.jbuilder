json.extract! consulta, :id, :nome_medico, :data, :horario,:created_at, :update_at
json.url consulta_url(consulta, format: :json)