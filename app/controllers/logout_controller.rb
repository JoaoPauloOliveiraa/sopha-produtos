class LogoutController < ApplicationController
  def logout
    cookies[:crud_sopha] = nil
    redirect_to '/login'
  end
end
