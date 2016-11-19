FactoryGirl.define do
  factory :admin do
    email FFaker::Internet.email
    password FFaker::Name.name
  end
end
