# spec/factories/comments.rb
FactoryBot.define do
  factory :comment do
    sequence(:text) { |n| "Comment #{n}" }
    association :user, factory: :user
    association :post
  end
end
