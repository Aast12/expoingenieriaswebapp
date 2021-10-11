class AddUserRefToProfessors < ActiveRecord::Migration[6.0]
  def change
    add_reference :professors, :user, foreign_key: true
  end
end
