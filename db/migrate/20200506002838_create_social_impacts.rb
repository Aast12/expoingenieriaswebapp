class CreateSocialImpacts < ActiveRecord::Migration[6.0]
  def change
    create_table :social_impacts do |t|
      t.text :problem
      t.text :empathy
      t.text :responsibility
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
