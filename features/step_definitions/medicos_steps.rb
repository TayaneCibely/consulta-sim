# step_definitions/medico_steps.rb

Given('estou na tela de criar Medico') do
  visit new_medico_path
  expect(page).to have_content('Cadastrar Médico')
end

When('eu preencho os campos, nome: {string}, crm: {string}, uf_crm: {string}, cpf:{string}, especialidade: {string}, email: {string}, inicio_consulta: {string}, termino_consulta: {string}') do |nome, crm, uf_crm, cpf, especialidade, email, inicio_consulta, termino_consulta|
  fill_in 'medico[nome]', with: nome
  fill_in 'medico[crm]', with: crm
  fill_in 'medico[uf_crm]', with: uf_crm
  fill_in 'medico[cpf]', with: cpf
  fill_in 'medico[especialidade]', with: especialidade
  fill_in 'medico[email]', with: email
  fill_in 'medico[inicio_consulta]', with: inicio_consulta
  fill_in 'medico[termino_consulta]', with: termino_consulta
end

When('clico em salvar') do
  click_button 'Salvar'
end

Then('Eu vejo a pagina do Medico {string}') do |nome|
  expect(page).to have_content(nome)
end

# Scenario: cadastrar um medico com nome invalido
Given('estou na pagina de cadastrar medico') do
  visit new_medico_path
  expect(page).to have_content('Cadastrar Médico')
end

When('eu preencho os campos sem nome, crm: {string}, uf_crm: {string}, cpf: {string}, especialidade: {string}, email: {string}, inicio_consulta:{string}, termino_consulta: {string}') do |crm, uf_crm, cpf, especialidade, email, inicio_consulta, termino_consulta|
  fill_in 'medico[crm]', with: crm
  fill_in 'medico[uf_crm]', with: uf_crm
  fill_in 'medico[cpf]', with: cpf
  fill_in 'medico[especialidade]', with: especialidade
  fill_in 'medico[email]', with: email
  fill_in 'medico[inicio_consulta]', with: inicio_consulta
  fill_in 'medico[termino_consulta]', with: termino_consulta
end

When('clico {string}') do |string|
  click_button 'Salvar'
end

Then('eu vejo uma mensagem de erro') do
  expect(page).to have_selector('.error-messages')
end

