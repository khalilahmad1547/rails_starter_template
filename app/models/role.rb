# frozen_string_literal: true

# Role
class Role < ApplicationRecord
  has_many :user_role

  ADMIN_ROLE = 'Admin'
  USER_ROLE = 'User'

  validates :name, uniqueness: true
end
