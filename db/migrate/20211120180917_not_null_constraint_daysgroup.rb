class NotNullConstraintDaysgroup < ActiveRecord::Migration[6.0]
  def change
    remove_reference :daysgroups, :project, null: false, foreign_key: true
  end
end
