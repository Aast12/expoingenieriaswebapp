class CreateCollaborators < ActiveRecord::Migration[6.0]
  def change
    create_table :collaborators do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :major
      t.string :student_code
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
