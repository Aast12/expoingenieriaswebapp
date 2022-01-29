class Student < ApplicationRecord
    belongs_to :user
    has_one :user, as: :userable
    has_many :project_participants
    has_many :projects, through: :project_participants
end
