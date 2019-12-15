# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
welcome = Album.where(title: 'Welcome').first
welcome.delete if welcome

albums = Album.create([title: 'Welcome', description: 'To the gallery app.', date: Date.current()])
pictures = Album.picture.create([title: 'Get started by adding pictures', date: Date.current()])
