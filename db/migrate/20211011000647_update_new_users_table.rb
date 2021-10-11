class UpdateNewUsersTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :userable_id, :bigint
    remove_column :users, :userable_type, :string
    remove_column :users, :status, :integer
    remove_column :users, :edition_id, :integer

    add_column :users, :is_student, :boolean
    add_column :users, :is_professor, :boolean
    add_column :users, :is_judge, :boolean
    add_column :users, :is_comittee_member, :boolean
    add_column :users, :is_admin, :boolean
    
  end
end
