class AddCityToVisitors < ActiveRecord::Migration[6.0]
  def change
    add_column :visitors, :city, :string
  end
end
