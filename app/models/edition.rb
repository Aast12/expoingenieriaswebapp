class Edition < ApplicationRecord
    has_many :users
    has_many :questions
    has_many :projects
    has_many :phases, dependent: :destroy
    accepts_nested_attributes_for :phases, allow_destroy: true
end
