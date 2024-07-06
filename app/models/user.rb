# frozen_string_literal: true

class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  validates :name, presence: true
  validates :email, format: { with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i }

  def self.from_omniauth(auth)
    data = auth.info
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = data.email
      user.password = Devise.friendly_token[0, 20]
      user.name = data.name
      user.avatar_url = data.image
    end
  end

  def confirmed_at
    Time.now.utc
  end
end
