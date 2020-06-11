class CreateProjectEventDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :project_event_details do |t|
      t.integer :stand
      t.integer :final_score
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
