class RemoveColumnDaysgroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :daysgroups, :day
  end
end
