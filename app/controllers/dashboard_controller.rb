class DashboardController < ApplicationController
  def index
  end

  def create_post
    @post = Post.new({
      title: params[:title],
      content: params[:content],
      user_id: params[:user_id]
      })
    if @post.save
      render json: {msg: t(:post_created)}
    else
      render json: {msg: t(:post_create_failed)}
    end
  end

  def permitted_params
    params.permit(post: [:title, :content, :user_id])
  end
end
