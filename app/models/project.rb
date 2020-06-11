class Project < ApplicationRecord
  enum status: [:registered, :approved, :disapproved, :evaluated, :accepted, :rejected, :declined, :missed]
  after_initialize :set_default_status, :if => :new_record?

  belongs_to :student
  belongs_to :professor
  belongs_to :institution
  belongs_to :edition
  has_one :project_event_detail
  has_one :committee_evaluation
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
end
