# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin.create(
  :email => 'admin@test.com',
  :password => '11111111',
  :password_confirmation => '11111111'
)

pr0 = Product.create(
  title: 'Test product 0',
  description: 'Test test test test test test test test test' \
               '<p> No images here </p>',
  price: 12.99
)

pr1 = Product.create(
  title: 'Test product 1',
  description: 'Test test test test test test test test test' \
               '<p> Some paragraph </p>',
  price: 12.99
)

Picture.create(
  product_id: pr1.id,
  image: File.new("#{Rails.root}/db/seed_images/1.jpg")
)

(2..15).each do |i|
  pr2 = Product.create(
    title: "Test product #{i}",
    description: 
    'Test test test <br />
     test test test test test test <br />
     test test test test test test test test test test test  <br />
     test test test test test test test test test test test test test test test test  <br />
     test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test',
    price: 11.99 + rand(20)
  )

  Picture.create(
    product_id: pr2.id,
    image: File.new("#{Rails.root}/db/seed_images/2.jpg")
  )

  Picture.create(
    product_id: pr2.id,
    image: File.new("#{Rails.root}/db/seed_images/1.jpg")
  )

  Picture.create(
    product_id: pr2.id,
    image: File.new("#{Rails.root}/db/seed_images/3.jpg")
  )
end
