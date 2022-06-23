class AddTypeColumnToCommitteeEvaluation < ActiveRecord::Migration[6.0]
  def change
    add_column :committee_evaluations, :typeof, :string
  end
end
