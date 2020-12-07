FactoryBot.define do
  factory :user do
  	id { |n| n }
    nickname { Faker::Lorem.characters(number: 10) }
    living_alone_month { Faker::Number(digits: 1) }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end