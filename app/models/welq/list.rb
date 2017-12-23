class Welq::List < Welq::Base

  def set_shard_instance(list)
    self.id = list.id
    self.title = list.title
    self
  end

end