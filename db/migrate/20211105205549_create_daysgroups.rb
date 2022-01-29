class CreateDaysgroups < ActiveRecord::Migration[6.0]
  def change
    create_table :daysgroups do |t|
      t.string :group
      t.date :day
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
