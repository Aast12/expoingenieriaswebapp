class AddEditionIdToUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :edition_id, :integer
    change_column :users, :edition_id, :integer, :null => false
  end

  def down
    remove_column :users, :edition_id
  end

end
