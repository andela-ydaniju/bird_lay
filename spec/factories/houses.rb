FactoryGirl.define do
  factory :house do
    name FFaker::Name.name
    code FFaker::Identification.ssn
    capacity 4_500
    stage 'Day Old'
    admin_id Admin
  end
end
