# gerenciamento_de_medicos_steps.rb
Given('estou na pagina de gerenciamento de medicos') do
  visit "/medicos"
  expect(page).to have_content('Cadastrar Médico')
end


When("eu clico no botao de {string} para cadastrar um novo medico") do |botao|
  click_on botao
end

Then("eu sou redirecionado para a pagina de {string}") do |pagina|
  expect(current_path).to eq "/medicos/new"
end

Then("eu preencho o formulario de registro com os dados do medico de nome: {string}, crm: {string}, uf_crm: {string}, cpf: {string}, especialidade: {string}, email: {string}, inicio_consulta: {string} e termino_consulta: {string}") do |nome, crm, uf_crm, cpf, especialidade, email, inicio_consulta, termino_consulta|
  fill_in 'Nome do Médico', with: nome
  fill_in 'CRM', with: crm
  fill_in 'UF-CRM', with: uf_crm
  fill_in 'CPF', with: cpf
  fill_in 'Especialidade', with: especialidade
  fill_in 'Email', with: email
  fill_in 'Início de Horário de Atendimento', with: inicio_consulta
  fill_in 'Término Horário de Atendimento', with: termino_consulta

end

Then("eu clico no botao{string} com o nome de cadastrar medico") do |botao|
  click_on botao
end

Then("eu sou redirecionado a pagina do medico {string} apos clicar no botao de {string}") do |nome_medico, botao|
  medico = Medico.find_by(nome: nome_medico)
  expect(page).to have_current_path("/medicos/#{medico.id}")
end

Then("eu clico no botão de gerenciamento {string} do medico {string}") do |nome_medico|
  expect(page).to hava_content(nome_medico)
end

Then("eu vejo os resuldados do gerenciamento relacionado ao medico {string}, crm: {string}, uf_crm: {string}, cpf:{string}, especilidade: {string}, email: {strign}, inicio_consulta: {string}, termino_consulta: {string} ") do |nome, crm, uf_crm, cpf, especialidade, email, inicio_consulta, termino_consulta|
  details_element = page.find('.medico-details')
  expect(details_element).to have_content(nome)
  expect(details_element).to have_content("CRM #{crm}")
  expect(details_element).to have_content("UF-CRM #{uf_crm}")
  expect(details_element).to have_content("CPF: #{cpf}")
  expect(details_element).to have_content("Especialidade #{especialidade}")
  expect(details_element).to have_content("Email #{email}")
  expect(details_element).to have_content("Início Horário de Atendimento #{inicio_consulta}")
  expect(details_element).to have_content("Término Horário de Atendimento #{termino_consulta}")
end

Given('eu clico no botao de gerenciamento {string} do medico {string}') do |botao, medico_nome|
  paciente = Paciente.find_by(nome: medico_nome)
  link_to_medico = page.find("a[href='/medicos/#{medico_id}']")
  link_to_medico.click
end
Quando("eu clico no botao com o nome de {string} Médico") do |acao|
  medico = Medico.find_by(nome: nome_medico)
  click_on "#{acao} Médico"
end

Quando("eu atualizo os dados do medico com nome: {string}, crm: {string}, uf_crm: {string}, cpf: {string}, especialidade: {string}, email: {string}, inicio_consulta: {string} e termino_consulta: {string}") do |nome, crm, uf_crm, cpf, especialidade, email, inicio_consulta, termino_consulta|
  medico = Medico.find_by(nome: nome)
  click_on "Editar Médico"
  fill_in 'Nome do Médico', with: nome
  fill_in 'CRM', with: crm
  fill_in 'UF-CRM', with: uf_crm
  fill_in 'CPF', with: cpf
  fill_in 'Especialidade', with: especialidade
  fill_in 'Email', with: email
  fill_in 'Início de Horário de Atendimento', with: inicio_consulta
  fill_in 'Término Horário de Atendimento', with: termino_consulta
  click_on 'Salvar'
end

Then("eu sou redirecionado a pagina do medico {string} apos clicar no botao de {string}") do |nome_medico, botao|
  medico = Medico.find_by(nome: nome_medico)
  expect(page).to have_current_path("/medicos/#{medico.id}")
end

And("eu vejo os resultados do gerenciamento relacionados ao medico {string}, crm: {string}, uf_crm: {string}, cpf: {string}, especialidade: {string}, email: {string}, inicio_consulta: {string} e termino_consulta: {string}") do |nome_medico, crm, uf_crm, cpf, especialidade, email, inicio_consulta, termino_consulta|
  details_element = page.find('.medico-details')
  expect(details_element).to have_content(nome_medico)
  expect(details_element).to have_content("CRM #{crm}")
  expect(details_element).to have_content("UF-CRM #{uf_crm}")
  expect(details_element).to have_content("CPF: #{cpf}")
  expect(details_element).to have_content("Especialidade #{especialidade}")
  expect(details_element).to have_content("Email #{email}")
  expect(details_element).to have_content("Início Horário de Atendimento #{inicio_consulta}")
  expect(details_element).to have_content("Término Horário de Atendimento #{termino_consulta}")
end

And("eu clico no botão de gerenciamento {string} do medico {string}") do |acao, nome_medico|
  medico = Medico.find_by(nome: nome_medico)
  click_on "Ver Detalhes"
end

When("eu clico no botao com o nome de {string} Médico") do |acao|
  medico = Medico.find_by(nome: nome_medico)
  click_on "Apagar Médico"
end

Then("eu sou redirecionado para a pagina de gerenciamento dos medicos") do
  expect(current_path).to eq '/medicos'
end

And("eu vejo uma mensagem de confirmação de exclusão {string}") do |mensagem|
  expect(page).to have_content(mensagem)
end

And("eu nao vejo mais o nome do medico {string} na lista de medicos") do |nome_medico|
  expect(page).not_to have_content(nome_medico)
end