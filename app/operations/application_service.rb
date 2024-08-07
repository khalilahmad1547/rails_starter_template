# frozen_string_literal: true

require 'dry/matcher/result_matcher'

module ApplicationService
  def self.included(klass)
    klass.prepend InstanceMethods
    klass.extend ClassMethods
  end

  module ClassMethods
    def call(params = {}, **args, &block)
      service_outcome = new.execute(params, **args)
      return service_outcome unless block

      Dry::Matcher::ResultMatcher.call(service_outcome, &block)
    end
  end

  module InstanceMethods
    include Dry::Monads[:result, :do]
    ValidationError = Class.new(StandardError)

    class Contract
      def call(_params)
        { failure?: false }
      end
    end

    def execute(params, **args)
      coerced_params = yield validate_params(params)
      super(coerced_params, **args)
    end

    private

    attr_reader :validation_outcome

    def validate_params(params)
      @validation_outcome = contract.new.call(params)
      return Failure(validation_outcome.errors.to_h) if validation_outcome.failure? # rubocop:disable Rails/DeprecatedActiveModelErrorsMethods

      Success(validation_outcome.to_h)
    end

    def contract
      self.class.const_get(:Contract)
    end

    def error_message(key, error)
      { key => [error] }
    end
  end
end
