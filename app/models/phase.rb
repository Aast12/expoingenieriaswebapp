class Phase < ApplicationRecord
  belongs_to :edition
  has_many :time_limits, dependent: :destroy
  accepts_nested_attributes_for :time_limits, allow_destroy: true
end
