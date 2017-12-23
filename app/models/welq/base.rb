class Welq::Base < ActiveRecord::Base
  self.abstract_class = true
  octopus_establish_connection(:welq)
end