class Category < ActiveRecord::Base
  has_ancestry

  belongs_to :site
  has_many :posts
end
