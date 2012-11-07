# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
  sequence :fullname do |n|
    "James Edward Grey #{n}"
  end

  factory :user do
    email
    password 'some-hash'
    fullname
  end
end
