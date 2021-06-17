# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    password { Faker::Internet.password }
    role do
      User.roles.each_value do |role_key|
        trait role_key do
          role { role_key.to_s }
        end
      end
    end
  end
end
