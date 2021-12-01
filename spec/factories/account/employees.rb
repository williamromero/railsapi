# frozen_string_literal: true

FactoryBot.define do
  factory :account_employee, class: 'Account::Employee' do
    email { Faker::Internet.email }
    age { rand(20..40) }
    password_digest { Faker::Internet.password(min_length: 10, max_length: 20) }
    type { 'Account::Employee' }
  end
end
