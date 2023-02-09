# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    respond_to :json
    before_action :configure_sign_in_params, only: [:create]

    private

    def respond_with(_resource, _options = {})
      render json: {
        status: { code: 200, message: 'User signed in successfully', data: UserSerializer.new(current_user) }
      }, status: :ok
    end

    def respond_to_on_destroy
      jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
                               ENV['SECRET_KEY_BASE'])
      puts jwt_payload.first
      current_user = User.find_by(jti: jwt_payload.first['jti'])
      if current_user
        render json: {
          status: 200,
          message: 'Signed out successfully'
        }, status: :ok
      else
        render json: {
          status: 401,
          message: 'User has no active session'
        }, status: :unauthorized
      end
    end

    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password])
    end
  end
end
