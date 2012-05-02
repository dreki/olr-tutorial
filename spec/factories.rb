
FactoryGirl.define do
  factory :user do
    name  'James Testy'
    email 'testy.face@example.com'
    password 'foobax'
    password_confirmation 'foobax'
  end
end
