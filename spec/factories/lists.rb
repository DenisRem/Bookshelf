# frozen_string_literal: true

FactoryBot.define do
  factory :list do
    name { Faker::Verb.simple_present }
  end
end
