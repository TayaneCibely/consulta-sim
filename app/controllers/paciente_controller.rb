class PacienteController < ApplicationController
  before_action :require_logged_in, only:[:edit, :update]
  def new
    @paciente = Paciente.new
    @paciente.build_endereco
  end

  def show

  end

  def create
    @paciente = Paciente.new(paciente_params)

    if @paciente.save
      flash[:success] = "Cadastro com Sucesso"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if current_paciente.update(paciente_params)
      flash[:success] = "Dados atualizados"
      redirect_to paciente_path
    else
      render 'edit'
    end
  end

  private
  def paciente_params
    params.require(:paciente).permit(:nome_completo, :data_nascimento, :cpf, :telefone, :email, :password, {:endereco_attributes => [:id, :cep, :cidade, :bairro, :logradouro, :complemento]})
  end
end
