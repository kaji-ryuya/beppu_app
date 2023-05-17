class AddColumnPhotoNoToSpa < ActiveRecord::Migration[7.0]
  def change
    add_column :spas, :photo_no, :integer
  end
end
