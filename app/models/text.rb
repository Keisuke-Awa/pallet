class Text < ActiveRecord::Base

  has_one :item, as: :item_content
  has_one :post, through: :item

end
