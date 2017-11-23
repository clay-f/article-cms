require 'test_helper'
class ArticleTest < ActiveSupport::TestCase
  def setup
    @article = build(:article)
  end

  test "get article" do
    refute_nil @article
  end
end
