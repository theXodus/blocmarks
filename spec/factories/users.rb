FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "foobar"
    password_confirmation "foobar"
    confirmed_at Time.now
  end
end
