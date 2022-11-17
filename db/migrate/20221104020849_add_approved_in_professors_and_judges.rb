class AddApprovedInProfessorsAndJudges < ActiveRecord::Migration[6.0]
  def change
    add_column :judges, :approved, :boolean, default: false
    add_column :professors, :approved, :boolean, default: false
  end
end
