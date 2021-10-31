class AddColumnToProjects < ActiveRecord::Migration[6.0]
  def change
      remove_column :projects, :main_student, :string
      remove_column :projects, :professor, :string 

      add_column :projects, :main_student, :string
      add_column :projects, :professor, :string
  end
end
