# spec/factories/likes.rb
FactoryBot.define do
  factory :like do
    association :user, factory: :user
    association :post
  end
end
