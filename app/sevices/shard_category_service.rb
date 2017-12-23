class ShardCategoryService < BaseService
  attr_accessor

  private

  def perform
    class_name = "#{site_name.capitalize}::Category".constantize
    ActiveRecord::Base.transaction do
      category = class_name.find_or_initialize_by(id: master_category.id)
      category.name = master_category.name
      category.slug = master_category.slug
      category.description = master_category.description
      category.ancestry = master_category.ancestry
      category.save
    end
  end

end
