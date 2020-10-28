class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # def truncate_description(description)
  #   description = strip_tag(description).truncate(30)
  # end
end
