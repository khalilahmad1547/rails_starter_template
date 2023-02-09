# frozen_string_literal: true

# UserPolicy
class UserPolicy < ApplicationPolicy
  # Scope
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
