class Edition < ApplicationRecord
    has_many :users
    has_many :questions
    has_many :projects
    has_many :time_limits, dependent: :destroy
    accepts_nested_attributes_for :time_limits, allow_destroy: true
end
