require 'minitest/autorun'

class ArticleTest < Minitest::Test

  def should_not_be_save_to_article_none_title
      article = Article.new
      assert_not article.save, "saved the article without title "
  end

  def should_report_error
      undifine_vaiable
      assert true
  end
end
