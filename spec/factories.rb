FactoryGirl.define do
  factory :user do
    sequence(:email)       {|n| "test#{n}@test.com" }
    password               "password"
    password_confirmation  "password"
    name                   "Brett Bim"
  end
  
  factory :admin, parent: :user do
    name  "Admin User"
    after(:create) do |admin|
      admin.add_role(FactoryGirl.create(:admin_role), FactoryGirl.create(:organization))
    end
  end

  factory :organization do
    name "Test Organization"
  end

  factory :role do 
    name "user"
  end
  factory :admin_role, class: Role do 
    name "admin"
  end
end
