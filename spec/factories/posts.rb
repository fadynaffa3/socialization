FactoryBot.define do
  factory :post do
    title Faker::Commerce.product_name
  end
end
