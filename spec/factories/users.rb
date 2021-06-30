# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    avatar { File.open("#{Rails.root}/app/assets/images/User_Account.png") }
    password { Faker::Internet.password }
    traits_for_enum :role, User.roles.values
    list
  end
end
