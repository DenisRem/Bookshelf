# frozen_string_literal: true

FactoryBot.define do
  factory :author do
    name { Faker::Book.author }
    avatar { File.open("#{Rails.root}/app/assets/images/User_Account.png") }
  end
end
