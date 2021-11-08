class AddInfoToProjects < ActiveRecord::Migration[6.0]
  def change


    rename_column :projects, :student_id, :main_student
    change_column :projects, :main_student, :bigint, :null => false

    rename_column :projects, :professor_id, :professor
    change_column :projects, :professor, :bigint, :null => false

    

  end
end
