class PostsController < ApplicationController
  def index
    @q = Post.search(params[:q])
    @posts = @q.result.order("created_at desc").page(params[:page])
		
		@search_field = :title_or_content_cont
  end

  def show
    @post = Post.find(params[:id])
  end
end
