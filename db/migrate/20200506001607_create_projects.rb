class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :status
      t.references :student, null: false, foreign_key: true
      t.references :professor, null: false, foreign_key: true
      t.references :institution, null: false, foreign_key: true
      t.references :edition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
