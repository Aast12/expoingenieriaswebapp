class ChangeDepartmentToNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column :professors, :department, :string, :null => false
  end
end
