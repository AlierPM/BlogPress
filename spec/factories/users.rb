# spec/factories/users.rb

FactoryBot.define do
  sequence :user_name do |n|
    "John Doe #{n}"
  end

  sequence :user_photo do |n|
    "https://example.com/photo_#{n}.jpg"
  end

  sequence :user_bio do |n|
    "A user bio goes here. #{n}"
  end

  factory :user do
    name { generate(:user_name) }
    photo { generate(:user_photo) }
    bio { generate(:user_bio) }
    posts_counter { 0 }

    # Add other attributes as needed
  end
end
