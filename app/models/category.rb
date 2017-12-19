class Category < ActiveRecord::Base
  has_ancestry

  belongs_to :site
end
