FactoryBot.define do
  factory :event do
    sequence(:name) { |n| "event#{format('%03d', n)}" }
    date { Time.zone.now }
  end
end
