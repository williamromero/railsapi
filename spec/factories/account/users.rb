# frozen_string_literal: true

FactoryBot.define do
  factory :account_user, class: 'Account::User' do
    email { Faker::Internet.email }
    age { rand(30..100) }
    password_digest { Faker::Internet.password(min_length: 10, max_length: 20) }
    type { 'Account::User' }
  end
end
