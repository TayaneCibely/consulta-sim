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

  # Adicione os métodos para médicos
  def new_medico
    redirect_to medico_path(current_medico) if medico_signed_in?
  end

  def create_medico
    medico = Medico.find_by(cpf: params[:session][:cpf])
    if medico && medico.authenticate(params[:session][:password])
      sign_in_medico(medico)
      redirect_to medico_path(medico)
    else
      flash.now[:danger] = "CPF ou senha inválidos"
      render 'new_medico'
    end
  end

  def destroy_medico
    sign_out_medico
    redirect_to root_path
  end
end
