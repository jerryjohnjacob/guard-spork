FactoryGirl.define do
  factory :user do
    name     "Monkey"
    email    "monkey@wildlife.net"
    password "foobar"
    password_confirmation "foobar"
  end
end
