class ProjectDetail < ApplicationRecord

  validates :name, presence: true, uniqueness: true, format: {with: /[
    a-zA-Z0-9_-]{2}/,message: "must contain name"}

  validates :category, presence: true, uniqueness: false, format: {with: /[
    a-zA-Z0-9_-]{2}/,message: "must contain category field"}

  validates :area, presence: true, uniqueness: false, format: {with: /[
    a-zA-Z0-9_-]{2}/,message: "must contain area"}

  validates :client_type, presence: true, uniqueness: false, format: {with: /[
    a-zA-Z0-9_-]{2}/,message: "must contain client type"}

  validates :description, presence: true, uniqueness: false, format: {with: /[
    a-zA-Z0-9_-]{2}/,message: "must contain description"}

  belongs_to :project
  has_one :project_category
  accepts_nested_attributes_for :project_category
  has_one :academic_level
  accepts_nested_attributes_for :academic_level
end
