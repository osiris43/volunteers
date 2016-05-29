FactoryGirl.define do
  factory :user do
    sequence(:email)       {|n| "test#{n}@test.com" }
    password               "password"
    password_confirmation  "password"
    name                   "Brett Bim"
  end
  
  factory :admin, parent: :user do
    name  "Admin User"
    admin true
  end

  factory :organization do
    name "Test Organization"
  end

  factory :role do 
    name "user"
  end
end
