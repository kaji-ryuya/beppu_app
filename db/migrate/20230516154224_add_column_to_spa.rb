class AddColumnToSpa < ActiveRecord::Migration[7.0]
  def change
    add_column :spas, :lat, :float
    add_column :spas, :lng, :float
  end
end
