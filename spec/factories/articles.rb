# frozen_string_literal: true

FactoryBot.define do
  
  factory :article do
    image { Rack::Test::UploadedFile.new(Rails.root.join( 'app/assets/images/test.png')) }
    title { Faker::Lorem.characters(number: 5) }
    genre { 1 }
    body  { Faker::Lorem.characters(number: 20) }
    association :user
  end
end