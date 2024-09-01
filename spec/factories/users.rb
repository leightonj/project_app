# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
    deleted_at { "2024-09-01 22:40:02" }
  end
end
