class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :spa, null: false, foreign_key: true

      t.timestamps
    end
    add_index :bookmarks, [:user_id, :spa_id], unique: :true
  end
end
