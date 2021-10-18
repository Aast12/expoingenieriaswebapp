class AddVisitorToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_visitor, :boolean
  end
end
