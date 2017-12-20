class PostsController < ApplicationController
  before_action :set_site
  before_action :set_post, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.site = @site
    @post.save
    redirect_to site_url(@site)
  end

  def edit; end

  def update
    @post.update(post_params)
    redirect_to site_url(@site)
  end

  def destroy
    @post.destroy
    redirect_to site_url(@site)
  end

  private
  def set_site
    @site = Site.find(params[:site_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text, :category_id)
  end
end
