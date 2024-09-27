# frozen_string_literal: true

module Api::V0::Auth
  class GoogleOauth2
    include ApplicationService

    class Contract < ApplicationContract
      params do
        required(:code).filled(:string)
      end
    end

    def execute(params)
      @params = params
      Success()
    end

    private

    attr_reader :params
  end
end
