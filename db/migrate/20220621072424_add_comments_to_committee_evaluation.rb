class AddCommentsToCommitteeEvaluation < ActiveRecord::Migration[6.0]
  def change
    add_column :committee_evaluations, :comments, :text
  end
end
