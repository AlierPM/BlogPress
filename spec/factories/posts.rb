# In your factories.rb file or relevant file where factories are defined
FactoryBot.define do
  factory :post do
    author_id { 1 }
    text { 'Nice post!' }
  end
end
