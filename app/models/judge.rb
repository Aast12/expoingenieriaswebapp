class Judge < ApplicationRecord
    has_one :user, as: :userable
    has_many :judge_evaluations
end
