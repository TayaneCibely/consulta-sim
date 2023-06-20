class SessionsController < ApplicationController
  def new
    redirect_to paciente_path(current_paciente) if paciente_signed_in?
  end

  def create
    paciente = Paciente.find_by(cpf: params[:session][:cpf])
    if paciente && paciente.authenticate(params[:session][:password])
      sign_in(paciente)
      redirect_to paciente_path(paciente)
    else
      flash.now[:danger] = "CPF ou senha inválidos"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
