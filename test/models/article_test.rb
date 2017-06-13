require 'test_helper'
class ArticleTest < ActiveSupport::TestCase
    include FactoryGirl::Syntax::Methods
    test "test factory" do
        art = create(:art1)
        assert art.valid?
    end

    test "test article title should be string" do
        art1 = build(:art1, title: "1helo")
        assert_kind_of String, art1.title, "article title should be string"
        assert_kind_of String, art1.title, "article title shouln't be integer"
        assert art1.valid?, "article title length should be > 3"
    end

    test "article-1 should belong to user1" do
        art1 = build(:art1)
        user1 = build(:user1)

        assert_equal art1.user_id, user1.id, "article-1 user_id should belong to user-1"
    end

    test "factory girl alias" do
        post = build(:article)
        assert_not_equal post.author.title, "hello world", "title couldn't be same"
    end
end
