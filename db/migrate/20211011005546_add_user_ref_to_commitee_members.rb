class AddUserRefToCommiteeMembers < ActiveRecord::Migration[6.0]
  def change
    add_reference :committee_members, :user, foreign_key: true
  end
end
