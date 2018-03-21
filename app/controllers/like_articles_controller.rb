class LikeArticlesController < ApplicationController
  def create
  end

  def destroy
  end

  private

  def like_article_params
    params.require(:like_article).permit(:user_id, :article_id, :state)
  end
end
