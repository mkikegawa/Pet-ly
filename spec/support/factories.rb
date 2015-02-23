FactoryGirl.define do
  factory :user do
    sequence(:name)      { |n| "Name Number #{ n }" }
    profile              { Faker::Lorem.paragraph }
    password              "foobar"
    password_confirmation "foobar"
    email                { Faker::Internet.email }

    factory :admin, parent: :user do
      email 'mkikegawa@gmail.com'
      admin true
    end
  end

  factory :pet do
    sequence(:name) { |n| "Pet Name #{ n }" }
    summary         { Faker::Lorem.sentence(2)}
    species         { Faker::Lorem.word }
    breed           { Faker::Lorem.word }
    sex             { Faker::Lorem.word }
    age             (1..12).to_a.sample
    color           { Faker::Lorem.word }
    description     { Faker::Lorem.sentence(2) }
    animalID        { Faker::Number.number(5) }
    orgID           { Faker::Number.number(4) }
    video1          { Faker::Internet.url('example.com', 'foorbar.html') }
    videoUrl1       { Faker::Internet.url('example.com', 'foorbar.html') }
    pic1            { Faker::Internet.url('example.com', 'foorbar.html') }
    pictmn1         { Faker::Internet.url('example.com', 'foorbar.html') }
    pic2            { Faker::Internet.url('example.com', 'foorbar.html') }
    pictmn2         { Faker::Internet.url('example.com', 'foorbar.html') }
    pic3            { Faker::Internet.url('example.com', 'foorbar.html') }
    pictmn3         { Faker::Internet.url('example.com', 'foorbar.html') }
    pic4            { Faker::Internet.url('example.com', 'foorbar.html') }
    pictmn4         { Faker::Internet.url('example.com', 'foorbar.html') }
  end

end