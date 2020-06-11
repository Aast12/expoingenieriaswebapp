class CreateOperatives < ActiveRecord::Migration[6.0]
  def change
    create_table :operatives do |t|

      t.timestamps
    end
  end
end
