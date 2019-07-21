FactoryBot.define do
  factory :place do
    sequence(:name) { |n| "place#{format('%03d', n)}" }
  end
end
