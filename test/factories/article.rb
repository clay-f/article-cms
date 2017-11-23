FactoryBot.define do
  factory :article do
    id 1
    title Faker::Book.title
    body  Faker::Witcher.quote
    association :catalog, factory: :history
    association :user, factory: :user
  end

  factory :shanguoyanyi, class: Article do
    id 2
    title Faker::Book.title
    body  Faker::Witcher.quote
    association :catalog, factory: :history
    association :user, factory: :foo
  end
end