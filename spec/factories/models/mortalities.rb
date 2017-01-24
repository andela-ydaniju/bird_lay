FactoryGirl.define do
  factory :mortality do
    count 5
    cause 'Something' * 40
    registrar
    house
  end
end
