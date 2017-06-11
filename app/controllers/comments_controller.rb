class CommentsController < ApplicationController

  before_action :get_article
  before_action :authenticate_user!

  def create
    binding.pry
    @comment = @article.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @article, notice: "creaed succeed"}
        format.js { }
      end
    else
      redirect_to @article, notice: "characters is too short or name has been taken"
    end
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    if @comment.destroy
      respond_to do |format|
        format.html { redirect_to @article }
        format.js { }
      end
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
