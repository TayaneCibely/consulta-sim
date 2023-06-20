 module SessionsHelper

   def sign_in(paciente)
     session[:paciente_id] = paciente.id
   end

   def sing_out
     session.delete(:paciente_id)
   end

   def current_paciente
     @current_paciente ||= Paciente.find_by(id: session[:paciente_id])
   end

   def paciente_signed_in?
     !current_paciente.nil?
   end
 end