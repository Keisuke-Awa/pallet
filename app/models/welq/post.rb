class Welq::Post < Welq::Base

  def set_instance(post)
    self.id = post.id
    self.title = post.title
    self.category_id = post.category_id
    self
  end

end