class ProjectDetail < ApplicationRecord
  belongs_to :project
  has_one :project_category
  accepts_nested_attributes_for :project_category

end
