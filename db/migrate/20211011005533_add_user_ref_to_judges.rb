class AddUserRefToJudges < ActiveRecord::Migration[6.0]
  def change
    add_reference :judges, :user, foreign_key: true
  end
end
