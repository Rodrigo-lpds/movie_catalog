FactoryBot.define do
  factory :movie do
    title { Faker::Name.name }
    release_year { Faker::Number.between(from: 1922, to: 2021) }
  end
end
