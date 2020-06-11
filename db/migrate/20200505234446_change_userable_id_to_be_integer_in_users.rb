class ChangeUserableIdToBeIntegerInUsers < ActiveRecord::Migration[6.0]
  def up
    change_column :users, :userable_id, :integer
  end

  def down
    change_column :users, :userable_id, :bigint
  end
end
