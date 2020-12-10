# frozen_string_literal: true

FactoryBot.define do
  factory :favorite do
    user_id { Faker::Number.number(digits: 1) }
    article_id { Faker::Number.number(digits: 1) }
  end
end