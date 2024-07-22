# frozen_string_literal: true

module Api::V0
  class AuthController < ApiController
    def signup
      Api::V0::Auth::SignupService.call(params.to_unsafe_h) do |result|
        result.success { |data| success_response(data, status: :created) }
        result.failure { |errors| unprocessable_entity(errors) }
      end
    end

    def signin
      Api::V0::Auth::SigninService.call(params.to_unsafe_h) do |result|
        result.success { |data| success_response(data, status: :ok) }
        result.failure { unauthorized_response }
      end
    end

    def refresh
      Api::V0::Auth::RefreshService.call(params.to_unsafe_h) do |result|
        result.success { |data| success_response(data, status: :created) }
        result.failure { unauthorized_response }
      end
    end
  end
end
