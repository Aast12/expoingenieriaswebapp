class CreateJudges < ActiveRecord::Migration[6.0]
  def change
    create_table :judges do |t|
      t.string :company
      t.string :department
      t.string :contact_name
      t.string :contact_email
      t.boolean :has_tablet

      t.timestamps
    end
  end
end
