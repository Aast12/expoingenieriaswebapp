class AddCampusToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :campus, :string

  end
end
