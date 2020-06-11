class AddInformationToProjectDetails < ActiveRecord::Migration[6.0]
  def change
    add_column :project_details, :category, :string
    add_column :project_details, :area, :string
    add_column :project_details, :type_of, :string
  end
end
