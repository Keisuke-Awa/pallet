class Category < ActiveRecord::Base
  has_ancestry

  belongs_to :site
  has_many :posts

  # after_save :shard_category

  def shard_category
    category = Welq::Category.find_or_initialize_by(id: self.id)
    category.name = self.name
    category.slug = self.slug
    category.description = self.description
    category.ancestry = self.ancestry
    category.save
  end

end
