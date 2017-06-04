require 'minitest/autorun'

class ArticleTest < ActiveSupport::TestCase
  test "create article" do
    article = Article.new(title: "foo", body: "foo")
    assert article.valid?
  end

  test "invalide without name" do
    article = Article.new(title: "foo")
    refute article.valid?, "user is valid without a name"
    assert_not_nil article.errors[:title], "no validation error for name present"
  end

  test "invalidate without title to save" do
      article = Article.new(body: "foo")
  end
end
