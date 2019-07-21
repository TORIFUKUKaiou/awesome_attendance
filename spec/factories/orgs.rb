FactoryBot.define do
  factory :org do
    sequence(:name) { |n| "name#{format('%03d', n)}" }
  end
end
