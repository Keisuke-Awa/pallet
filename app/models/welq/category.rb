class Welq::Category < Welq::Base

  def set_shard_instance(category)
    self.id = category.id
    self.title = category.title
    self.category_id = category.category_id
    self
  end

end