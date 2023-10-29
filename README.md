# README
#Consultório Consulta-Sim

Atidade Ruby & Rails

Tayane Cibely Batista Rodrigues

##Links do Projeto 
https://consulta-sim-coj0.onrender.com

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/466c46df0797451182d41a7b64fcdbd6)](https://app.codacy.com/gh/TayaneCibely/consulta-sim/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)

Requisitos:

Um paciente deve poder se cadastrar, editar seu cadastro e visualizar seu cadastro;
o Cada paciente deve ter os campos: nome completo, data de nascimento, CPF, e-mail
e endereço (CEP, cidade, bairro, logradouro e complemento). O endereço deve ser
uma classe de Model diferente de paciente;
o Um paciente deve poder agendar sua consulta escolhendo a data, horário e o
médico;
o A consulta deve ser um Model que se relaciona com Paciente e Médico;
o O médico deve poder se cadastrar, editar e visualizar seu cadastro;
o Cada médico deve ter os campos: nome completo, CPF, e-mail, especialidade e
número do CRM;
o O médico deve poder visualizar todas as consultas que estão agendadas para ele;
o É necessário implementar corretamente os validations para todos os campos. Pelo
menos três validações por campo. Por exemplo, não deve ser possível adicionar uma
data de nascimento maior que a data atual ou um CPF que contém letras e etc.
 Também é necessário implementar corretamente os associations:
o Um paciente possui um endereço e agenda uma ou mais consultas;
o Uma consulta é feita por um paciente e é atendida por um médico;
o Um médico atende uma ou mais consultas;
o A página inicial do sistema deve ser criada e deve conter links para as
funcionalidades implementadas;
o A view de endereço não pode ser acessada diretamente. Só deve ser possível criar,
editar e remover um endereço a partir da view de paciente.
