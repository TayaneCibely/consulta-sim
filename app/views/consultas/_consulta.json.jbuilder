json.array! @consulta, partial: "consultas/consulta", as: :consulta
json.url consulta_url(consulta, format: :json)