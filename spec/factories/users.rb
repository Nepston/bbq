FactoryBot.define do
  factory :user do
    name { 'Oleg' }
    sequence(:email) { |n| "someguy_#{n}@example.com" }

    after(:build) { |u| u.password_confirmation = u.password = '123456' }
  end
end