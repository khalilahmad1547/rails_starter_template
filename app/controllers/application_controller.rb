# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::API
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    render json: { message: 'You are not allowed for this action' }, status: :unauthorized
  end
end
