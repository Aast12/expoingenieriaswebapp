class EditJudgesTable < ActiveRecord::Migration[6.0]
  def change
    add_column :judges, :external, :bool
    add_column :judges, :contact_phone, :string
  end
end
