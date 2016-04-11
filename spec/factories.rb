FactoryGirl.define do
  factory :user do
    sequence(:email)       {|n| "test#{n}@test.com" }
    password               "password"
    password_confirmation  "password"
    name                   "Brett Bim"
  end
end
