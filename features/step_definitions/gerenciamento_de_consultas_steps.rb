# gerenciamento_de_consultas_steps.rb

# Scenario: Marcar uma consulta
When("eu estou na página de marcação de consulta") do
  visit "new_consulta_path"
end

And("eu seleciono o paciente {string} da lista") do |nome_paciente|
  select nome_paciente, from: 'Paciente'
end

And("eu seleciono o médico {string} da lista") do |nome_medico|
  select nome_medico, from: 'Médico'
end

And("eu preencho a data {string} e horário {string} para a consulta") do |data, horario|
  fill_in 'Data', with: data
  fill_in 'Horario', with: horario
end

And("eu clico no botão de marcar consulta {string}") do |string|
  click_on 'Agendar Consulta'
end

Then("eu sou redirecionado para a página da consulta") do |string|
  expect(page).to have_current_path(consulta_path)
end

Then("eu vejo os dados da última consulta criada") do |botao|
  expect(page).to have_current_path(consulta_path(Consulta.last))
end

When("eu estou na página de marcação de consulta") do
  visit "/consulta"
end

And("eu preencho a data {string} e horário {string} para a consulta") do |data, horario|
  fill_in 'Data', with: data
  fill_in 'Horario', with: horario
end

When("eu estou na página de visualizar consultas") do
  expect(current_path).to eq '/consultas'
end

And("eu clico no botão de {string} para a consulta do paciente {string} e médico {string}") do |botao, nome_paciente, nome_medico|
  consulta = Consulta.find_by(paciente: nome_paciente, medico: nome_medico, data: "2023-08-30", horario: "15:00")
  click_on "Detalhes do Agendamento #{consulta.id}"
end

And("eu clico no botão de {string} para remover a consulta") do |botao|
  click_on 'Apagar Consulta'
end

Then("eu sou redirecionado para a página das consultas") do
  expect(current_path).to eq '/consultas'
end

And("eu não vejo mais os detalhes da consulta na página que foi marcada com {string} e o médico {string} na data {string} e horário {string}") do |nome_paciente, nome_medico, data, horario|
  consulta = Consulta.find_by(paciente: nome_paciente, medico: nome_medico, data: data, horario: horario)
  expect(page).not_to have_selector("a[href='/consultas/#{consulta.id}']")
end
