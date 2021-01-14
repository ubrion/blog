class Api::AuthsController < ApiController
  skip_before_action :authenticate

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      render json: { token: user.token }, status: :ok
    else
      render json: { error: 'Datos incorrectos' }, status: :unprocessable_entity
    end
  end
end
