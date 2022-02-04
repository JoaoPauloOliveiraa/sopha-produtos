class ApplicationController < ActionController::Base
  before_action :validate_login

  def validate_login
    if cookies[:crud_sopha].present?
      admin = JSON.parse(cookies[:crud_sopha])
      if admin['id'].present?
        administrators = Administrator.where(id: admin['id'])
        if administrators.count > 0
          @administrator = administrators.first
          return
        end
      end
    end
    redirect_to '/login'
  end
  
  def current_admin?
    admin = JSON.parse(cookies[:crud_sopha])
    if @administrator.id == admin['id'].to_i
      redirect_to administrators_url, alert: 'Não é possível deletar administrador logado!'
    end
  end
end
