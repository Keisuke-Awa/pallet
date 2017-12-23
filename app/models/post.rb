class Post < ActiveRecord::Base

  belongs_to :site
  belongs_to :category

  has_many :items
  accepts_nested_attributes_for :items, allow_destroy: true
end


