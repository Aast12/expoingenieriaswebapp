class Judge < ApplicationRecord
    belongs_to :user
    has_many :judge_evaluations
end
