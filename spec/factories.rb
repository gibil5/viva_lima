

# jr@oblique:  26/08/14

# To test the user profile
# The subsequent definition is for a User model object 
FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end

