class AddUserRefToAdministrators < ActiveRecord::Migration[6.0]
  def change
    add_reference :administrators, :user,  foreign_key: true
  end
end
