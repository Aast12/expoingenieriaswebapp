class AddColumnPics < ActiveRecord::Migration[6.0]
  def change
      add_column :virtual_samples, :pic1, :string
      add_column :virtual_samples, :pic2, :string
      add_column :virtual_samples, :pic3, :string
      add_column :virtual_samples, :pic4, :string
      add_column :virtual_samples, :pic5, :string

      add_column :projects, :campus, :string
  end
end
