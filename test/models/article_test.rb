require 'test_helper'
class ArticleTest < ActiveSupport::TestCase
  def setup
    @article = build(:article)
  end

  test "get article with article and catalog" do
    @article
  end
end
