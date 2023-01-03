class Role < ApplicationRecord
  has_many :user_role

  validates :name, uniqueness: true
end
