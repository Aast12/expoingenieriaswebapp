class AddUserRefToStudents < ActiveRecord::Migration[6.0]
  def change
   add_reference :students, :user, foreign_key: true
  end
 
end
