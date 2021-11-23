class NullConstraingWarning < ActiveRecord::Migration[6.0]
  def change
    remove_reference :stands, :project, null: false, foreign_key: true
  end
end
