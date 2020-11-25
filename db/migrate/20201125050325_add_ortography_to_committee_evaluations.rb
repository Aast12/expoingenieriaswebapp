class AddOrtographyToCommitteeEvaluations < ActiveRecord::Migration[6.0]
  def change
    add_column :committee_evaluations, :ortography, :integer
  end
end
