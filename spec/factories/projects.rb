# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    creator factory: :user
    title { Faker::Book.title }
    description { Faker::Lorem.paragraph }
  end
end
