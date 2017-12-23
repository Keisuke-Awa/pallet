class List < ActiveRecord::Base

  has_one :item, as: :item_content
  has_one :post, through: :item

  has_many :list_items, dependent: :destroy

end
