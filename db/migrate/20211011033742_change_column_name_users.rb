class ChangeColumnNameUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :is_comitee_member, :is_committee_member
  end
end
