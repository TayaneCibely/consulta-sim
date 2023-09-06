Given('Existe o Paciente de nome {string}, cpf: {string}, email: {string} e Número de telefone: {string} no sistema') do |nome, cpf, nascimento, email, telefone|
  Paciente.create!(
    nome_completo: nome,
    data_nascimento: nascimento,
    cpf: cpf,
    email: email,
    telefone: telefone
  )
end

Given('eu estou na pagina de busca de pacientes') do
  visit "/pacientes"
end

When('eu pesquiso por {string} no campo {string} de paciente') do |nome, campo|
  fill_in campo, with: nome
end

Then('eu sou redirecionado para a página do paciente {string} ao clicar no botão de Ver detalhes') do |nome_paciente|
  paciente = Paciente.find_by(nome_completo: nome_paciente)
  link_to_paciente = page.find("a[href='/pacientes/1']")
  link_to_paciente.click
  #click_on 'Ver detalhes'
end

Then('vejo as informações do paciente {string}') do |nome_paciente|
  #puts page.body
  paciente = Paciente.find_by(nome_completoe: nome_paciente)
  expect(page).to have_content(paciente.nome_completo)
  expect(page).to have_content(paciente.cpf)
  expect(page).to have_content(paciente.data_nascimento)
  expect(page).to have_content(paciente.email)
  expect(page).to have_content(paciente.telefone)
end


When('eu pesquiso por um nome de paciente que não existe no sistema no campo {string} de paciente') do |campo|
  fill_in campo, with: "Pedro Álvares Cabral da Fonseca Peres Silva Péricles Artur"
end

Then('eu vejo a mensagem {string} na nova tela de pacientes') do |mensagem|
  expect(page).to have_content(mensagem)
end

When('eu pesquiso pelo cpf {string} no campo {string} de paciente') do |cpf, campo|
  fill_in campo, with: cpf
end

Then('eu vejo resultados relacionados ao paciente {string}') do |nome_paciente|
  expect(page).to have_content(nome_paciente)
end

Then('vejo o link com o nome de {string}') do |nome_paciente|
  #puts page.body
  expect(page).to have_content("Ver detalhes")
  expect(page).to have_content(nome_paciente)
end

Then('eu sou redirecionado para a página do paciente {string} ao clicar no botão de {string} na busca por cpf') do |nome_paciente, nome_botao|
  #puts page.body
  click_on(nome_botao)
  #puts page.body
end

