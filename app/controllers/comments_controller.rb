class CommentsController < ApplicationController

  before_action :get_article
  before_action :authenticate_user!

  def create
    @comment = @article.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @article, notice: "created succeed."
    else
      redirect_to @article, notice: "name or descrip is too short."
    end
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    if @comment.destroy
      redirect_to @article
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :description, :article_id, :user_id)
  end

  def get_article
    @article = Article.find(params[:article_id])
  end
end
