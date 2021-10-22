class ProjectDetail < ApplicationRecord
  belongs_to :project
  has_one :project_category
  accepts_nested_attributes_for :project_category
  has_one :academic_level
  accepts_nested_attributes_for :academic_level
end
