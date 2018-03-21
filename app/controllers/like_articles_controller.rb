class LikeArticlesController < ApplicationController
  def create
    state = {state: 0}
    if user_signed_in?
      article = Article.friendly.find(params.require(:like_article).fetch(:article_id))
      like_article = current_user.like_articles.where(user_id: current_user.id, article_id: article.id).first
      if like_article.nil?
        current_user.like_articles.create(article_id: article.id, state: 1)
      else
        like_state = 
          case like_article.state
          when 0 then 1
          when 1 then 0
            0
          end
          like_article[:state] = like_state
          like_article.save
      end
      state[:state] = 1
    end
    respond_to do |format|
      format.js
      format.json { render json: state}
    end
  end

  def destroy
  end
end
