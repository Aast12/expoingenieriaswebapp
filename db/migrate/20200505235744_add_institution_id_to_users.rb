class AddInstitutionIdToUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :institution_id, :integer
    change_column :users, :institution_id, :integer, :null => false
  end

  def down
    remove_column :users, :institution_id
  end

end
