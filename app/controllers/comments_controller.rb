class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :comemntable_comment

  def create
    @comment = @article.comments.create(comment_params)
    if @comment.class.name == "Comment"
      @comment.parent_id = @article.id
    end
    @comment.user_id = current_user.id
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @article, notice: "created succeed" }
        format.js
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
    params.require(:comment).permit(:description, :article_id, :user_id)
  end

  def comemntable_comment
    @article = 
      unless params[:comment_id].nil?
        Comment.find(params[:comment_id])
      else
        Article.friendly.find(params[:article_id])
      end
  end
end
