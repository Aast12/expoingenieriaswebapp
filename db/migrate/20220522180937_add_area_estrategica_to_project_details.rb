class AddAreaEstrategicaToProjectDetails < ActiveRecord::Migration[6.0]
  def change
    add_column :project_details, :strategicarea, :string
  end
end
