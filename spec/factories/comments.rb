FactoryBot.define do
  factory :comment do
    text { Faker::Name.name }
    status { false }
  end
end
