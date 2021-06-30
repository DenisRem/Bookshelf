# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    publishing_house { Faker::Book.publisher }
    language { Faker::Nation.language }
    year_of_publication { Faker::Number.number(digits: 4) }
    number_of_pages { Faker::Number.number(digits: 3) }
    format { '180х180 mm' }
    binding { Faker::Commerce.material }
    ISBN { Faker::Number.number(digits: 13) }
    avatar { File.open("#{Rails.root}/app/assets/images/User_Account.png") }
    availability { Faker::Boolean.boolean }
  end
end
