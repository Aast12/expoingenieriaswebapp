class AddApprovalAttributesToCommitteeMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :committee_members, :can_approve_committee_members, :boolean, default: false
    add_column :committee_members, :active, :boolean, default: true
    add_reference :committee_members, :edition, index: true
  end
end
