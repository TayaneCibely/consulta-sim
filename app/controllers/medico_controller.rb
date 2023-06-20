class MedicoController < ApplicationController
  before_action :require_logged_in, only:[:edit, :update]

  def new
    @medico = Medico.new
  end

  def show

  end

  def create
    @medico = Medico.new(medico_params)

    if @medico.save
      flash[:success] = "Cadastrado com Sucesso"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if current_medico.update(medico_params)
      flash[:success] = "Dados atualizados"
      redirect_to consultas_path
    else
      render 'edit'
    end
  end

  private
    def medico_params
      params.require(:medico).permit(:nome, :crm, :uf_crm, :especialidade,:cpf, :email, :password)
    end
end