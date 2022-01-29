class CreateStands < ActiveRecord::Migration[6.0]
  def change
    create_table :stands do |t|
      t.integer :number
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
