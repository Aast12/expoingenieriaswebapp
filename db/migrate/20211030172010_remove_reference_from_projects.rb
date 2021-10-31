class RemoveReferenceFromProjects < ActiveRecord::Migration[6.0]
  def change
        remove_column :projects, :main_student_id
        remove_column :projects, :professor_id
        remove_reference :projects, :main_student, index:true
        remove_reference :projects, :professor, index:true
  end
end
