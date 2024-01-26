FactoryBot.define do
  factory :comment do
    association :user
    association :post
  end
end
