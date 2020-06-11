class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :major
      t.string :student_code

      t.timestamps
    end
  end
end
