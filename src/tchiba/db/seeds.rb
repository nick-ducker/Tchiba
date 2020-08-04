# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

n = 1
user_id = n

4.times do
  email = "email#{n}@email.com"
  encrypted_password = "password#{n}"
  name = "user#{n}"
  bio = "I am a bio for #{name}"
  user = User.new(email: email, password: encrypted_password, name: name, bio: bio)
  user.skip_confirmation!
  user.save!
  n += 1
end

n = 1

4.times do
  number = n
  street = "street #{n}"
  suburb = "suburb #{n}"
  state = "state #{n}"
  postcode = n + 5000
  user = User.find(n)
  user.create_address(number: number, street: street, suburb: suburb, state: state, postcode: postcode)
  #user.create_cart
  n += 1
end

# n = 1
# x = 1

# 8.times do
#   name = "blend#{n}"
#   price = n
#   quantity = n + 10
#   descrip = "This is a description"
#   weight = 500
#   User.find(x).blends.create(name: name, price: price, quantity: quantity, descrip: descrip, weight: weight)
#   if n % 2 == 0
#     x += 1
#     n += 1
#   else
#     n += 1
#   end
# end

# carts = Cart.all

# carts.each do |cart|
#   3.times do
#     cart.cart_items.create(blend_id: rand(1..8), blend_quantity: rand(1..5))
#   end

#   cart.cart_items.each do |cart_item|
#     gross = cart_item.blend.price * cart_item.blend_quantity
#     shipping = cart_item.blend.shipping_cost
#     discount = cart_item.blend.discount_amount * cart_item.blend_quantity
#     total = (gross + shipping) - discount
#     cart_item.create_order(buyer_id: cart_item.cart.user_id, seller_id: cart_item.blend.user_id, gross: gross, total: total, discount: discount )
#   end
  
# end

# orders = Order.all

# orders.each do |order|
#   order.transactions.create(amount: order.total, paid:true)
# end

# Property.create(name: "Black" , descrip: "Tea Type")
# Property.create(name: "Green" , descrip: "Tea Type")
# Property.create(name: "Oolong" , descrip: "Tea Type")
# Property.create(name: "Pu'erh" , descrip: "Tea Type")
# Property.create(name: "White" , descrip: "Tea Type")
# Property.create(name: "Herbal" , descrip: "Tea Type")
# Property.create(name: "Oolong" , descrip: "Tea Type")
# Property.create(name: "Matcha" , descrip: "Tea Type")
# Property.create(name: "Chai" , descrip: "Tea Type")
# Property.create(name: "Herbal" , descrip: "Tea Type")
# Property.create(name: "Berry" , descrip: "Flavour")
# Property.create(name: "Chocolate" , descrip: "Flavour")
# Property.create(name: "Cinnamon" , descrip: "Flavour")
# Property.create(name: "Citrus" , descrip: "Flavour")
# Property.create(name: "Coconut" , descrip: "Flavour")
# Property.create(name: "Floral" , descrip: "Flavour")
# Property.create(name: "Fruity" , descrip: "Flavour")
# Property.create(name: "Ginger" , descrip: "Flavour")
# Property.create(name: "Grassy" , descrip: "Flavour")
# Property.create(name: "Malty" , descrip: "Flavour")
# Property.create(name: "Mint" , descrip: "Flavour")
# Property.create(name: "Nutty" , descrip: "Flavour")
# Property.create(name: "Spicy" , descrip: "Flavour")
# Property.create(name: "Sweet" , descrip: "Flavour")
# Property.create(name: "Vanilla" , descrip: "Flavour")