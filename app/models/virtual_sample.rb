class VirtualSample < ApplicationRecord
  include Filterable

  scope :filter_by_name, -> (name) { joins(:project).merge(Project.filter_by_name(name)) }
  scope :filter_by_category, -> (category) { includes(:project).merge(Project.filter_by_category(category)) }
  scope :filter_by_area, -> (area) { includes(:project).merge(Project.filter_by_area(area)) }
  scope :filter_by_professor, -> (id) { includes(:project).where(projects: { professor_id: id } ) }
  scope :filter_by_department, -> (id) { includes(:project).where(projects: { department_id: id } ) }
  scope :filter_by_institution, -> (id) { includes(:project).where(projects: { institution_id: id } ) }
  scope :filter_by_social_service, -> (bool) { includes(:project).merge(Project.filter_by_social_service(bool)) }
  
  belongs_to :project
  has_one_attached :icon_image, :dependent => :destroy
  has_one_attached :about_file, :dependent => :destroy
  has_one_attached :video_file, :dependent => :destroy
  has_many_attached :images, :dependent => :destroy
  has_many :comments, :dependent => :destroy
end
