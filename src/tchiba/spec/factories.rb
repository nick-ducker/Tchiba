FactoryBot.define do
  factory :cart_item do
    cart_id { 1 }
    blend_id { 1 }
  end

  factory :cart do
    user_id { 1 }
  end

  factory :transaction do
    order_id { 1 }
    amount { 9.99 }
  end

  factory :order do
    cart_id { 1 }
    buyer_id { 1 }
    seller_id { 2 }
    gross { 9.99 }
    total { 9.99 }
  end

  factory :review do
    user_id { 1 }
    blend_id { 1 }
    rating { "2.44" }
    descrip { "MyText" }
  end

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
    conversation_id { 1 }
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