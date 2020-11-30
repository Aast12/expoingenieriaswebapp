class CreateProjectAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :project_areas do |t|
      t.string :name

      t.timestamps
    end
  end
end
