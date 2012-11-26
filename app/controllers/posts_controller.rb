class PostsController < ApplicationController
  def index
    search_term = ""
    if params["term"]
      search_term = params["term"]
    end
    title_results = Post.search({"title_cont" => search_term}).result(:distinct => true, :order => 'created_at desc')
    content_results = Post.search({"content_cont" => search_term}).result(:distinct => true, :order => 'created_at desc')
    blah = title_results.merge(content_results)
    if blah.count > 0
      @posts = blah
    else
      @posts = Post.find(:all, :order => 'created_at desc')
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end
