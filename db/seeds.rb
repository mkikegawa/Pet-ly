# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([
    { name: "Martin Kikegawa",  profile: "I like grey kittens", admin: true, email: "martinkikegawa@gmail.com" }, 
    { name: "Marcy Criner", profile: "I like calico cats.", 
      password_digest: "$2a$10$UUf57GlGT7VDTucDPw6gQOLThNhE1iQJ5G9ngv86vzBHe0N6BYi0u", 
      remember_token: "1a1cf264fc8f78ac9063d8e8de11858672f0c83e", email: "test@test.com" },
    { name: "Inder Tofu", profile: "I like calico cats.", 
      password_digest: "$2a$10$AEutt0MiuYLY8dkwsXhDMu23fENKjmTLtXxyy4Et3R2ezGFC96NUy", 
      remember_token: "36a9996c227117b60375306018ce3fe49fd7d0aa", admin: true, email: "mkikegawa@gmail.com" }
    ])

pets = Pet.create([{ name: 'Squeaks', species: 'cat', breed: 'Domestic Shorthair', sex: 'Female', age: '3', color: 'grey', animalID: 12345 },
    { name: 'Josie', species: 'cat', breed: 'Persian', sex: 'Male', age: '9', color: 'black', animalID: 54321 },
    { name: 'Diesel', species: 'dog', breed: 'hound', sex: 'Male', age: '2', color: 'brown', animalID: 34521 }])
