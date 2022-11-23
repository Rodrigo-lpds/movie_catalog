FactoryBot.define do
  factory :comment do
    text { Faker::Name.name }
  end
end
