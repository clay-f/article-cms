class LikeArticlesController < ApplicationController
  def create
    state = {operate_state: 0}
    if user_signed_in?
      article = Article.friendly.find(params.require(:like_article).fetch(:article_id))
      like_article = get_like_article(article)
      state[:article_state] = like_article.state
      state[:operate_state] = 1
    end
    respond_to do |format|
      format.json { render json: state }
      format.html
    end
  end

  def destroy
  end

  private

  def get_like_article(article)
    if current_user.like_articles.where(article_id: article.id).empty?
      current_user.like_articles.create(article_id: article.id, state: 1)
    else
      tmp_article = current_user.like_articles.where(article_id: article.id).first
      case
      when tmp_article.state == 0
        tmp_article.state = 1
      else
        tmp_article.state = 0
      end
      tmp_article.save
    end
    current_user.like_articles.where(article_id: article.id).first
  end
end
