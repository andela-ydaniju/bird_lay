FactoryGirl.define do
  factory :user do
    email FFaker::Internet.email
    password FFaker::Name.name
  end
end