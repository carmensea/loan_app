FactoryBot.define do
  factory :user do
    first_name "mogli"
    last_name "brown"
    email "mogli@mogli.com"
    password "password"

    factory :admin do
      admin true
    end
  end
end
