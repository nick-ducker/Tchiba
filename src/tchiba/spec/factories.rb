FactoryBot.define do
  factory :property do
    name { "MyString" }
    descrip { "MyText" }
  end

  factory :blend do
    user_id { 1 }
    name { "MyString" }
    price { "9.99" }
    quantity { 1 }
    descrip { "MyText" }
    weight { 100 }
  end

  factory :message do
    content { "MyText" }
    conversation { 1 }
  end

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