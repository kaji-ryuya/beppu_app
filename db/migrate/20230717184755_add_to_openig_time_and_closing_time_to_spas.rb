class AddToOpenigTimeAndClosingTimeToSpas < ActiveRecord::Migration[7.0]
  def change
    add_column :spas, :opening_time, :float
    add_column :spas, :closing_time, :float
  end
end
