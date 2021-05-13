class DropTimeLimits < ActiveRecord::Migration[6.0]
    def up
      remove_reference :time_limits, :phase, foreign_key: true
      drop_table :time_limits
    end
  
    def down
      fail ActiveRecord::IrreversibleMigration
    end
  
end
