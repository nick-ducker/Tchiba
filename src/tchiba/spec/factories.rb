FactoryBot.define do

  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
    email { generate :email }
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

  factory :conversation do
    to_user_id { 1 }
    from_user_id { 2 }
    blend_id { 1 }
  end
end