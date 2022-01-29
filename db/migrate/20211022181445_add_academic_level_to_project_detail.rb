class AddAcademicLevelToProjectDetail < ActiveRecord::Migration[6.0]
  def change
    add_column :project_details, :academic_level, :string
  end
end
