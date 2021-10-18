class ChangeInsitutionToNullInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :institution_id, :integer, :null => true
  end
end
