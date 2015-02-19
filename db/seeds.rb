# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([{ name: "Martin Kikegawa",  profile: "I like grey kittens" }, 
    { name: "Marcy Criner", profile: "I like calico cats." }])

pets = Pet.create([{ name: 'Squeaks', species: 'cat', breed: 'Domestic Shorthair', sex: 'Female', age: '3', color: 'grey', animalID: 12345 },
    { name: 'Josie', species: 'cat', breed: 'Persian', sex: 'Male', age: '9', color: 'black', animalID: 54321 },
    { name: 'Diesel', species: 'dog', breed: 'hound', sex: 'Male', age: '2', color: 'brown', animalID: 34521 }])
