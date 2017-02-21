# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Category.destroy_all

3.times do |t|
	Category.create(name: "categoria #{t}")
end

Product.create(name: "Producto 1", category_id: Category.find_by(name: "categoria 0").id, price: 300)
categoria = Category.find_by(name: "categoria 0")
producto = categoria.products.build(name: "Producto_build 1", price: 300)
producto.save

b = Product.last
b.destroy

c = Product.last
c.premium = true
c.save

categorias = Category.all
categorias.each do |cat|
	cat.name.upcase!
	cat.save
end