class CreateProjectDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :project_details do |t|
      t.string :name
      t.text :description
      t.text :video_url
      t.boolean :semestre_i
      t.boolean :social_impact
      t.string :client_type
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
