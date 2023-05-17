class AddColumnToSpas < ActiveRecord::Migration[7.0]
  def change
    add_column :spas, :message, :string
    add_column :spas, :family_bath_info, :string
  end
end
