class CreateSecondaryProfessors < ActiveRecord::Migration[6.0]
  def change
    create_table :secondary_professors do |t|
      t.references :professor, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.timestamps
    end
  end
end
