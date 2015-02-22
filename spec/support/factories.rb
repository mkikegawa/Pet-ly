FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Name Number #{ n }" }
    email 


end