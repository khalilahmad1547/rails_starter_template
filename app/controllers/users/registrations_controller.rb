# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  private

  # POST /resource
  # def create
  #   super
  # end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name email password])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name email password])
  end
end
