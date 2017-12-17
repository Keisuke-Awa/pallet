class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update]
  before_action :set_site, except: :destroy

  def index
    @categories = @site.categories
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def set_site
    @site = Site.find(params[:site_id])
  end
end
