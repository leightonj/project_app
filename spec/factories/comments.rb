# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    project
    creator factory: :user
    text { Faker::Lorem.paragraph }
  end
end
