# frozen_string_literal: true

# UserSerializer
class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :jti
end
