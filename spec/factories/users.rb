# spec/factories/users.rb

FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    photo { 'https://example.com/photo.jpg' }
    bio { 'A user bio goes here.' }
    posts_counter { 0 }

    # Add other attributes as needed
  end
end
