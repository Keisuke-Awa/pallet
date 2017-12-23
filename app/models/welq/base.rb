class Welq::Base < ActiveRecord::Base
  self.abstract_class = true
  octopus_establish_connection(:welq)

  # def set_instance(object)
  #   object.attributes.each do |k,v|
  #     self.send(k) unless k == 'site_id' || k == 'created_at' || k == 'updated_at'
  #   end
  #   self
  # end

  end