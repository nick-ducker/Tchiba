FactoryBot.define do
  factory :user do
    email { "them@test.com" }
    password  { "password" }
  end

  factory :address do
    user_id { 1 }
    number  { 99 }
    street { "Test St" }
    suburb { "Suburbia" }
    state { "SA" }
    postcode { 9999 }
  end
end