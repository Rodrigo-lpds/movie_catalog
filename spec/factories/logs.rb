FactoryBot.define do
  factory :log do
    approved_date { Faker::Number.between(from: 1922, to: 2021) }
  end
end
