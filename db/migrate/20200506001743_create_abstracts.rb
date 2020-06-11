class CreateAbstracts < ActiveRecord::Migration[6.0]
  def change
    create_table :abstracts do |t|
      t.text :problem
      t.text :methodology
      t.text :feasibility
      t.text :results
      t.text :impact
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
