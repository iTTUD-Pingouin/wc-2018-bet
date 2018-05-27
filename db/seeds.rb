# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'creating empty group ...'
Group.create!(name: "Je n'ai pas encore de groupe")
puts 'Empty group created'

puts 'creating two real groups ...'
Group.create!(name: "Z5")
Group.create!(name: "Le Wagon")
puts 'Z5 and Le Wagon created !'

puts 'creating admin: "guillaume.dutti@live.fr" ...'
User.create!(email: 'guillaume.dutti@live.fr', password: 'madrid&"', group_id: 1, admin: true)
puts 'Admin created !'

puts 'creating 2 users: "guillaume.dutti@live.fr" ...'
User.create!(email: 'travisdbickle@outlook.fr', password: 'madrid&"')
User.create!(email: 'ouistiti@hotmail.fr', password: '123456')
puts 'Users created !'

puts 'Creating all poules'
Poule.create!(name: 'A')
Poule.create!(name: 'B')
Poule.create!(name: 'C')
Poule.create!(name: 'D')
Poule.create!(name: 'E')
Poule.create!(name: 'F')
Poule.create!(name: 'G')
Poule.create!(name: 'H')
puts 'Poules created !'


puts 'creating 4 firsts games'
Game.create!(team1: 'France', team2: 'Espagne', poule_id: 1, domflag: 'France.png', extflag: 'Spain.png')
Game.create!(team1: 'Brésil', team2: 'Croatie', poule_id: 1, domflag: 'Brazil.png', extflag: 'Croatia.png')
Game.create!(team1: 'Japon', team2: 'Suisse', poule_id: 2, domflag: 'Japan.png', extflag: 'Suisse.png')
Game.create!(team1: 'Suede', team2: 'Nigeria', poule_id: 2, domflag: 'Sweden.png', extflag: 'Nigeria.png')
puts 'Games created'
puts 'Ready to code !'
