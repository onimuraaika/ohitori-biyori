# frozen_string_literal: true

FactoryBot.define do
  
  factory :article_comment do
    comment { Faker::Lorem.characters(number: 20) }
    association :user
    association :article
  end
  
end