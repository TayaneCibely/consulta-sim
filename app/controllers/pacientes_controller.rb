class PacientesController < ApplicationController
  before_action :set_paciente, only: %i[show edit update destroy]

  def index
    @pacientes = Paciente.all
  end

  def new
    @paciente = Paciente.new
    @paciente.build_endereco
  end

  def show
  end

  def edit
  end

  def search
  end

  def create
    @paciente = Paciente.new(paciente_params)

    respond_to do |format|
      if @paciente.save
        format.html { redirect_to paciente_url(@paciente), notice: "Paciente criado com sucesso." }
        format.json { render :show, status: :created, location: @paciente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @paciente.update(paciente_params)
        format.html { redirect_to paciente_url(@paciente), notice: "Paciente atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @paciente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @paciente.destroy

    respond_to do |format|
      format.html { redirect_to pacientes_url, notice: "Paciente apagado com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  def set_paciente
    @paciente = Paciente.find(params[:id])
    @endereco = Endereco.find_by_paciente_id(@paciente.id)
  end

  def paciente_params
    params.require(:paciente).permit(:nome_completo, :data_nascimento, :cpf, :telefone, :email, endereco_attributes: [:id, :cep, :cidade, :bairro, :logradouro, :complemento])
  end

end
