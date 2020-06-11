class CreateJudgeEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :judge_evaluations do |t|
      t.references :judge, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
