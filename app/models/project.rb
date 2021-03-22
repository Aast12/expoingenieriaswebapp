class Project < ApplicationRecord
  enum status: [:registered, :approved, :disapproved, :evaluated, :accepted, :rejected, :declined, :missed]
  after_initialize :set_default_status, :if => :new_record?

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
