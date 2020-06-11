class CreateCommitteeMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :committee_members do |t|

      t.timestamps
    end
  end
end
