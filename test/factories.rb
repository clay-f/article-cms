require 'test_helper'
FactoryGirl.define do
    factory :art1, class: Article do
        title "art1"
        body  "hello world"
        user_id 1
    end

    factory :art2, class: Article do
        title "art2"
        body "article 2"
        user_id 2
    end

    factory :user1, class: User do
        id 1
        name "f"
        email "123@qq.com"
        password "123456"
    end

    factory :user2, class: User do
        id 2
        name "foo"
        email "1234@qq.com"
        password "123456"
    end

    factory :comment1, class: Comment do
        user_id 1
        article_id 1
        name "comment 1"
        description "comment 1"
    end

    factory :comment2, class: Comment do
        user_id 1
        article_id 1
        name "comment 2"
        description "comment 2"
    end

    factory :comment3, class: Comment do
        user_id 2
        article_id 2
        name "comment 3"
        description "comment 3"
    end
end
