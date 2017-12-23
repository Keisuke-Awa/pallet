class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update]
  before_action :set_site, except: :destroy

  def index
    @categories = @site.categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.site = @site
    @category.save
    ShardCategoryService.new(
        site_name: @site.name,
        master_category: @category,
        ).run
    redirect_to site_categories_path(@site)
  end

  def edit; end

  def update
    @category.update(category_params)
    ShardCategoryService.new(
        site_name: @site.name,
        master_category: @category,
        ).run
    redirect_to site_categories_path(@site)
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

  def category_params
    params.require(:category).permit(:name, :slug, :parent_id, :description)
  end
end
