# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@tester.com" }
    name { Faker::Name.name }
    password { 'password' }
  end
end
