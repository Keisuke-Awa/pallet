class Welq::Item < Welq::Base

  def set_shard_instance(item)
    self.id = item.id
    self.post_id = item.post_id
    self.item_content_id = item.item_content_id
    self.item_content_type = item.item_content_type
    self.order = item.order
    self
  end
end