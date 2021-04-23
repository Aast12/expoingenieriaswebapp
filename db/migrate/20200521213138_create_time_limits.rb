class CreateTimeLimits < ActiveRecord::Migration[6.0]
  def change
    create_table :time_limits do |t|
      t.text :name
      t.date :start_date
      t.date :end_date
      t.references :edition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
