class CreateAdministrators < ActiveRecord::Migration[6.0]
  def change
    create_table :administrators do |t|

      t.timestamps
    end
  end
end
