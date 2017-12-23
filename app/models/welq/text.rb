class Welq::Text < Welq::Base

  def set_shard_instance(text)
    self.id = text.id
    self.content = text.content
    self
  end
end