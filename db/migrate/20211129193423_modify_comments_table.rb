class ModifyCommentsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :user_name, :string
    add_column :comments, :user_type, :string
    remove_column :comments, :user_id, :string
  end
end
