class PostsController < ApplicationController
  before_action :set_site

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.site = @site
    @post.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_site
    @site = Site.find(params[:site_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
