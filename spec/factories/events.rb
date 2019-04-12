FactoryBot.define do
  factory :event do
    title { 'Вечеринка' }
    description { 'Отмечаем ДР' }
    address { 'Kazan' }
    datetime { DateTime.parse('01.07.2019 15:00') }

    association :user
  end
end