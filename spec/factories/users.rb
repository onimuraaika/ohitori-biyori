# frozen_string_literal: true

FactoryBot.define do
  
  factory :user do
  	id                    { |n| n }
    nickname              { Faker::Lorem.characters(number: 10) }
    living_alone_month    { Faker::Number.number(digits: 1) }
    email                 { Faker::Internet.email }
    password              { 'password' }
    password_confirmation { 'password' }
  end
  
end