class AddStaffMemberToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_staff_member, :boolean
    add_reference :staff_members, :user, foreign_key: true
  end
end
