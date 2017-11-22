FactoryBot.define do
  factory :user do
    id 1
    name "anna"
    password "123456"
    email "anna@qq.com"
  end

  factory :foo, class: User do
    id 2
    name "foo"
    password "123456"
    email "foo@qq.com"
  end
end