# frozen_string_literal: true

class BaseService
  include ApplicationService

  class Contract < ApplicationContract
    params do
      required(:id).filled(:integer)
    end
  end

  def execute(id)
    puts "** BaseService #{id}"
  end
end
