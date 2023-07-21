FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user_#{n}"}
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }

    trait :admin do
      sequence(:name) { |n| "admin_#{n}"}
      sequence(:email) { |n| "admin_#{n}@example.com" }
      role { :admin }
    end
  end
end
