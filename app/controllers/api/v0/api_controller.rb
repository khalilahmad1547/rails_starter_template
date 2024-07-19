# frozen_string_literal: true

module Api::V0
  class ApiController < ActionController::API
    rescue_from StandardError do |exception|
      case exception.class.name
      when ActiveRecord::RecordInvalid.name then unprocessable_entity(exception.message)
      else process_standard_error(exception)
      end
    end

    private

    def process_standard_error(exception)
      render json: { errors: exception.message }, status: :internal_server_error
    end

    def unauthorized_response(reason = 'You are unauthorized to view this resource')
      render json: { errors: [reason] }, status: :unauthorized
    end

    def not_found_response(reason = 'The requested resource does not exist')
      render json: { errors: [reason] }, status: :not_found
    end

    def unprocessable_entity(reason)
      render json: { errors: [reason] }, status: :unprocessable_entity
    end

    def forbidden_response
      head :forbidden
    end
  end
end
