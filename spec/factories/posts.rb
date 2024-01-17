# spec/factories/posts.rb
FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph }
    comments_counter { Faker::Number.between(from: 0, to: 100) }
    likes_counter { Faker::Number.between(from: 0, to: 100) }
    author_id { FactoryBot.create(:user).id } # Assuming you have a user factory

    # Add other attributes as needed

    # If you have any specific traits or sequences, you can define them here
    # trait :published do
    #   published { true }
    # end

    # sequence(:title) { |n| "Post Title #{n}" }
  end
end
