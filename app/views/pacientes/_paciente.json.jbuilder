json.extract! paciente, :id, :nome_completo, :data_nascimento, :cpf, :email, :telefone, :created_at, :updated_at
json.url paciente_url(paciente, format: :json)
