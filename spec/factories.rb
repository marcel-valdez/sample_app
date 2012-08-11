include FactoryGirl

FactoryGirl.define do
  factory :user do
    name "Marcel Valdez"
    email "marcel@server.com"
    password "password"
    password_confirmation "password"
  end
end