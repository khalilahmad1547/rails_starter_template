class Role < ApplicationRecord
  has_many :user_role

  ADMIN_ROLE = 'Admin'.freeze
  USER_ROLE = 'User'.freeze

  validates :name, uniqueness: true
end
