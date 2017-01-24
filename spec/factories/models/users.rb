FactoryGirl.define do
  factory :user, aliases: [:registrar] do
    email FFaker::Internet.email
    password 'password'
  end
end
