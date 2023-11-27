Given('estou na pagina de cadastro de paciente') do
  visit new_paciente_path
end

When('eu prencho os campos, nome_completo: {string}, data_nascimento: {string}, cpf: {string}, email: {string}, telefone: {string}, cep: {string}, cidade: {string}, bairro: {string}, logradouro: {string}, complemento: {string}') do |nome_completo, data_nascimento, cpf, email, telefone, cep, cidade, bairro, logradouro, complemento|
  fill_in 'paciente[nome_completo]', with: nome_completo
  fill_in 'paciente[data_nascimento]', with: data_nascimento
  fill_in 'paciente[cpf]', with: cpf
  fill_in 'paciente[email]', with: email
  fill_in 'paciente[telefone]', with: telefone
  fill_in 'paciente[endereco_attributes][cep]', with: cep
  fill_in 'paciente[endereco_attributes][cidade]', with: cidade
  fill_in 'paciente[endereco_attributes][bairro]', with: bairro
  fill_in 'paciente[endereco_attributes][logradouro]', with: logradouro
  fill_in 'paciente[endereco_attributes][complemento]', with: complemento

end

When('clico em {string}') do |string|
  click_button 'Salvar'
end

Then('Eu vejo a pagina do Paciente {string}') do |nome|
  expect(page).to have_content(nome)
end