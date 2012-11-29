class PostsController < ApplicationController
  def index
    @q = Post.search(params[:q])
    @posts = @q.result.order("created_at desc").page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end
end
