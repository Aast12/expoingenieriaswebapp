class CreateVirtualSamples < ActiveRecord::Migration[6.0]
  def change
    create_table :virtual_samples do |t|
      t.text :video_link
      t.references :project, null: false, foreign_key: true
      t.timestamps
    end
  end
end
