class LoginController < ApplicationController
  skip_before_action :validate_login
  def index; end

  def logging 
    administrator = Administrator.where(email: params[:email]).first
    if(administrator.present? && BCrypt::Password.new(administrator.password_hash) == params[:password_hash]) 
      expire = 24.hours.from_now
      value = {
        id: administrator.id,
        name: administrator.name,
        email: administrator.email
      }
      cookies[:crud_sopha] = { value: value.to_json, expires: expire, httponly: true }

      redirect_to '/products'
    else
      redirect_to '/login', alert: 'Email ou senha inválidos'
    end
  end
end
