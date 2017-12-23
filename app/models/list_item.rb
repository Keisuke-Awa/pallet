class ListItem < ActiveRecord::Base
  belongs_to :list, touch: true
end
