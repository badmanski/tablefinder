class MainController < ApplicationController
  skip_before_filter :authorize
  def index
    @posts = Post.all.reverse
  end

  def create_comment
    @comment = Comment.new({
      author: params[:author],
      content: params[:content],
      post_id: params[:post_id]
      })
    if @comment.save
      render json: {msg: t(:comment_created)}
    else
      render json: {msg: t(:comment_create_failed)}
    end
  end

  def permitted_params
    params.permit(comment: [:author, :content, :post_id])
  end
end
