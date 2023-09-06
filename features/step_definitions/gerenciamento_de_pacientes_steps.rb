Given('Existe o Paciente de nome {string}, cpf: {string}, data_de_nascimento: {string}, email: {string}, telefone: {string}, endereco_attributes: { cep: {string},  cidade: {string}, bairro: {string}, logradouro: {string}, complemento: {string}}') do |nome, cpf, nascimento, email, telefone, cep, cidade, bairro, logradouro, complemento|
  Paciente.create!(
    nome_completo: nome,
    cpf: cpf,
    data_nascimeto: nascimento,
    email: email,
    telefone: telefone,
    endereco_attributes:{cep: cep,
       cidade: cidade,
       bairro: bairro,
       logradouro: logradouro,
       complemento: complemento}
  )
end

Given('eu estou na pagina de gerenciamento de pacientes') do
  visit "/pacientes"
end

When('eu clico no botão {string} para registrar um novo paciente') do |botao|
  click_on botao
end

Then('e eu sou redirecionado para a pagina de gerenciamento de pacientes {string}') do |string|
  #puts page.body
  expect(page).to have_content "Novo Paciente"
end

Then('eu preencho o formulario de registro com os dados do paciente de nome: {string}, CPF: {string}, Data de Nascimento: {string}, Email: {string}, Número de Telefone: {string}, CEP: {string}, Cidade: {string}, Bairro: {string}, Logradouro: {string} e Complemento: {string}') do |nome_completo, cpf, data_nascimento, email, telefone, cep, cidade, bairro, logradouro, complemento|
  fill_in 'Nome do Paciente:', with: nome
  fill_in 'CPF:', with: cpf
  fill_in 'Data de Nascimento', with: data_nascimento
  fill_in 'Email:', with: email
  fill_in 'Telefone:', with: telefone
  fill_in 'CEP', with: cep
  fill_in 'Cidade', with: cidade
  fill_in 'Bairro', with: bairro
  fill_in 'Logradouro', with: logradouro
  fill_in 'Complemento', with: complemento
end

Then('eu clico no botão escrito {string} para salvar os dados do paciente') do |botao|
  click_on botao
end

Then('eu sou redirecionado para a pagina do paciente {string}') do |string|
  paciente = Paciente.find_by(nome_completo: string)
  expect(current_path).to eq "/pacientes/#{paciente.id}"
end

Then('eu vejo os detalhes do paciente {string} exibidos na página') do |string|
  paciente = Paciente.find_by(nome_completo: string)
  expect(page).to have_content(paciente.nome_completo)
  expect(page).to have_content(paciente.cpf)
  expect(page).to have_content(paciente.data_nascimento)
  expect(page).to have_content(paciente.email)
  expect(page).to have_content(paciente.telefone)
  expect(page).to have_content(paciente.cep)
  expect(page).to have_content(paciente.cidade)
  expect(page).to have_content(paciente.bairro)
  expect(page).to have_content(paciente.logradouro)
  expect(page).to have_content(paciente.complemento)
end

# puts page.body
#poderia haver uma refatoracao aqui para encontrar o linktopatient pelo paciente_nome

When('eu clico no botão de gerenciamento {string} do paciente {string}') do |botao, paciente_nome|
  paciente = Paciente.find_by(nome_completo: paciente_nome)
  link_to_patient = page.find("a[href='/pacientes/#{paciente.id}']")
  link_to_patient.click
  #puts page.body #eh direcionado para o id/1
end

Then('eu clico no botão com o nome de {string} para editar os dados') do |botao|
  click_on(botao)
end

Then('eu sou redirecionado para a página de edição dos dados do paciente {string}') do |string|
  expect(page).to have_content("Editar Paciente")
end

When('eu atualizo os dados do paciente paciente de nome: {string}, CPF: {string}, Data de Nascimento: {string}, Email: {string}, Número de Telefone: {string}, CEP: {string}, Cidade: {string}, Bairro: {string}, Logradouro: {string} e Complemento: {string}') do |nome_completo, cpf, data_nascimento, email, telefone, cep, cidade, bairro, logradouro, complemento|
  fill_in 'Nome do Paciente:', with: nome
  fill_in 'CPF:', with: cpf
  fill_in 'Data de Nascimento', with: data_nascimento
  fill_in 'Email:', with: email
  fill_in 'Telefone:', with: telefone
  fill_in 'CEP', with: cep
  fill_in 'Cidade', with: cidade
  fill_in 'Bairro', with: bairro
  fill_in 'Logradouro', with: logradouro
  fill_in 'Complemento', with: complemento
end

When('eu clico no botão {string} para salvar os dados do paciente') do |botao|
  click_on botao
end

Then('eu vejo resultados de gerenciamento relacionados ao paciente {string}') do |paciente_nome|
  paciente = Paciente.find_by(nome_completo: paciente_nome)

  expect(page).to have_content(paciente.nome_completo)
  expect(page).to have_content(paciente.cpf)
  expect(page).to have_content(paciente.data_nascimento)
  expect(page).to have_content(paciente.email)
  expect(page).to have_content(paciente.telefone)
  expect(page).to have_content(paciente.cep)
  expect(page).to have_content(paciente.cidade)
  expect(page).to have_content(paciente.bairro)
  expect(page).to have_content(paciente.logradouro)
  expect(page).to have_content(paciente.complemento)
end


Then('eu vejo o botão com o nome de {string}') do |botao|
  expect(page).to have_button(botao)
end

Then('eu sou redirecionado para a pagina de gerenciamento dos pacientes') do
  expect(current_path).to eq '/pacientes'
end

