FactoryBot.define do
  factory :catalog do
    name "catalog"
  end

  factory :history, class: Catalog do
    name "History"
  end

  factory :technology, class: Catalog do
    name "Technology"
  end

  factory :philosophy, class: Catalog do
    name "Philosophy"
  end
end