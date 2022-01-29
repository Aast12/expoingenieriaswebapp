class ChangeStandToStringValue < ActiveRecord::Migration[6.0]
  def change
    change_column :stands, :number, :string
  end
end
