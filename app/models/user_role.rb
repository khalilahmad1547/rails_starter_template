# frozen_string_literal: true

# UserRole
class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :role

  validates_associated :user
  validates_associated :role
end
