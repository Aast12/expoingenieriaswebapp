class JudgeEvaluation < ApplicationRecord
  belongs_to :judge
  belongs_to :project
end
