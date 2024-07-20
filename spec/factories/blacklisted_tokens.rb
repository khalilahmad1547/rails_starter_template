# frozen_string_literal: true

FactoryBot.define do
  factory :blacklisted_token do
    jti { 'MyString' }
    user { nil }
    exp { '2024-07-20 08:34:56' }
  end
end
