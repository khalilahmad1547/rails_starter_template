# frozen_string_literal: true

class RefreshToken < ApplicationRecord
  belongs_to :user
  before_create :set_crypted_token

  attr_accessor :token

  def self.find_by_token(token)
    crypted_token = Digest::SHA256.hexdigest token
    RefreshToken.find_by(crypted_token:)
  end

  private

  def set_crypted_token
    self.token = SecureRandom.hex
    self.crypted_token = Digest::SHA256.hexdigest(token)
    self.exp = Time.zone.now + Constants::REFRESH_TOKEN_LIFETIME
  end
end
