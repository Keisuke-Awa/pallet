class Item < ActiveRecord::Base

  belongs_to :item_content, polymorphic: true
  accepts_nested_attributes_for :item_content, allow_destroy: true

end
