FactoryBot.define do
  factory :comment do
    id 1
    description Faker::StarWars.quote
    association :user, factory: :user, strategy: :build
    association :article, factory: :article, strategy: :build
  end
end