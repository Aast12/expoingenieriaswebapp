class AddProfessoreScoreToCommitteeEvaluations < ActiveRecord::Migration[6.0]
  def change
    add_column :committee_evaluations, :professor_score, :integer
  end
end
