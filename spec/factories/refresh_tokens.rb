# frozen_string_literal: true

FactoryBot.define do
  factory :refresh_token do
    crypted_token { 'MyString' }
    user { nil }
    exp { '2024-07-20 08:38:07' }
  end
end
