class AddToOpenigTimeAndClosingTimeToSpas < ActiveRecord::Migration[7.0]
  def change
    add_column :spas, :opening_time, :time
    add_column :spas, :closing_time, :time
  end
end
