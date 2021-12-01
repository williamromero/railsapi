# frozen_string_literal: true

FactoryBot.define do
  factory :account_owner, class: 'Account::Owner' do
    email { Faker::Internet.email }
    age { rand(18..60) }
    password_digest { Faker::Internet.password(min_length: 10, max_length: 20) }
    type { 'Account::Owner' }
  end
end
