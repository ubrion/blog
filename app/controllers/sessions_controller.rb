class SessionsController < ApplicationController
  def new
    redirect_to root_path if current_user
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id.to_s

      redirect_to root_path, notice: "Te has conectado correctamente."
    else
      redirect_to new_sessions_path, alert: "Datos incorrectos."
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path, notice: "Desconectado correctamente"
  end
end
