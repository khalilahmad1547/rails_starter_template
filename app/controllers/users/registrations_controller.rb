# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

    private

    def respond_with(resource, _options = {})
      if resource.persisted?
        render json: {
          status: { code: 200, message: 'Signed up successfully', data: UserSerializer.new(resource) }
        }, status: :ok
      else
        puts resource.errors.full_messages
        render json: { message: 'User could not be created successfull',
                       errors: resource.errors.full_messages, status: :unprocessable_entity }
      end
    end

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name email password])
    end

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name email password])
    end
  end
end
