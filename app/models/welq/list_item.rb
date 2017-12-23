class Welq::ListItem < Welq::Base

  def set_shard_instance(list_item)
    self.id = list_item.id
    self.list_id = list_item.list_id
    self.content = list_item.content
    self.order = list_item.order
    self
  end

end