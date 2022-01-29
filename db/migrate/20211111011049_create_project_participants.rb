class CreateProjectParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :project_participants do |t|
      t.integer :project_id
      t.integer :student_id

      t.timestamps
    end
  end
end
