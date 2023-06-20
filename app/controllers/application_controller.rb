class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def require_logged_in
    unless paciente_signed_in?
      flash[:danger] = "Opção Inválida"
      redirect_to root_path
    end
  end
end
