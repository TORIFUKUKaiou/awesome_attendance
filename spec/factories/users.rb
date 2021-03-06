FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{format('%03d', n)}@example.com" }
    sequence(:name) { |n| "name#{format('%03d', n)}" }
    password { 'foobar' }
    password_confirmation { 'foobar' }
    code { nil }

    factory :password_nil_user do
      password { nil }
    end
  end
end
