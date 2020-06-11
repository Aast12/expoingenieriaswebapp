class CreateCommitteeEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :committee_evaluations do |t|
      t.integer :description
      t.integer :problem
      t.integer :methodology
      t.integer :feasibility
      t.integer :results
      t.integer :impact
      t.integer :score
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
