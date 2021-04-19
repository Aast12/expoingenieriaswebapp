class Project < ApplicationRecord
  include Filterable

  enum status: [:registered, :approved, :disapproved, :evaluated, :accepted, :rejected, :declined, :missed]
  after_initialize :set_default_status, :if => :new_record?

  scope :filter_by_name, -> (name) { joins(:project_detail).where("project_details.name LIKE ?", "%#{name}%") }
  scope :filter_by_category, -> (category) { includes(:project_detail).where(project_details: { category: category }) }
  scope :filter_by_area, -> (area) { includes(:project_detail).where(project_details: { area: area }) }
  scope :filter_by_professor, -> (id) { where(professor_id: id) }
  scope :filter_by_department, -> (id) { where(department_id: id) }
  scope :filter_by_institution, -> (id) { where(institution_id: id) }
  scope :filter_by_social_service, -> (bool) { includes(:project_detail).where(project_details: { social_impact: bool }) }
  scope :filter_by_status, -> (status) { where(status: status) }

  belongs_to :student
  belongs_to :professor
  belongs_to :institution, required: false
  belongs_to :edition
  has_one :project_event_detail
  has_one :committee_evaluation
  has_one :virtual_sample
  has_many :judge_evaluations

  has_one :abstract, dependent: :destroy
  accepts_nested_attributes_for :abstract, allow_destroy: true
  has_one :project_detail, dependent: :destroy
  accepts_nested_attributes_for :project_detail, allow_destroy: true
  has_one :social_impact, dependent: :destroy
  accepts_nested_attributes_for :social_impact, allow_destroy: true

  def set_default_status
    self.status ||= :registered
  end

  def accepted?
    self.status == "accepted"
  end
  def project_category
    self.project_detail.category
  end
  def project_area
    self.project_detail.area
  end
  def servicio
    self.project_detail.social_impact
  end
end
