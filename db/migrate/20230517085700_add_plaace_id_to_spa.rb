class AddPlaaceIdToSpa < ActiveRecord::Migration[7.0]
  def change
    add_column :spas, :place_id, :string
  end
end
