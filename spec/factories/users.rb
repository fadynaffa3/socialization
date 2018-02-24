FactoryBot.define do
  factory :user do
    name Faker::Commerce.product_name
  end
end
