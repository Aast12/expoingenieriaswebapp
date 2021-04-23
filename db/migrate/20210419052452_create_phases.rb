class CreatePhases < ActiveRecord::Migration[6.0]
  def change
    remove_reference :time_limits, :edition, foreign_key: true

    create_table :phases do |t|
      t.text :phase_name
      t.date :start_date
      t.date :end_date
      t.references :edition, null: false, foreign_key: true
    end

    add_reference :time_limits, :phase, foreign_key: true

  end
    
end
