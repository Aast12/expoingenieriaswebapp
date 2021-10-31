class AddInfoToProjects < ActiveRecord::Migration[6.0]
  def change


    rename_column :projects, :student_id, :main_student
    change_column :projects, :main_student, :string, :null => false

    rename_column :projects, :professor_id, :professor
    change_column :projects, :professor, :string, :null => false

    

  end
end
