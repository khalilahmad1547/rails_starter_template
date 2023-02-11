# frozen_string_literal: true

# User
class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_one :user_role, dependent: :destroy

  delegate :role, to: :user_role

  validates_presence_of :first_name, :last_name

  def admin?
    role.name == Role::ADMIN_ROLE
  end

  def user?
    role.name == Role::USER_ROLE
  end
end
