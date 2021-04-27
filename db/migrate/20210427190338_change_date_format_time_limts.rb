class ChangeDateFormatTimeLimts < ActiveRecord::Migration[6.0]
  def change
    change_column :phases, :start_date, :datetime
    change_column :phases, :end_date, :datetime 
    
    change_column :time_limits, :start_date, :datetime
    change_column :time_limits, :end_date, :datetime

  end
end
