FactoryBot.define do
  factory :comment do
    id 1
    article_id 1
    name Faker::Name.name
    description Faker::StarWars.quote
    user
  end

  factory :foo_comment, class: Comment do
    id 2
    article_id 1
    name Faker::Name.name
    description Faker::StarWars.quote
  end
end