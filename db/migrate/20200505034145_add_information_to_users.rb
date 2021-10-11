class AddInformationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :status, :integer
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :userable_id, :bigint
    add_column :users, :userable_type, :string

  end
end
