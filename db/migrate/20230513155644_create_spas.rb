class CreateSpas < ActiveRecord::Migration[7.0]
  def change
    create_table :spas do |t|
      t.string :name
      t.integer :spring_quality, null: false, default: 0
      t.integer :place, null: false, default: 0
      t.integer :location, null: false, default: 0
      t.integer :charactor, null: false, default: 0
      t.boolean :have_family_bath, null: false, default: false
      t.string :address
      t.string :telephone_number
      t.string :price
      t.string :holiday
      t.string :business_time
      t.string :is_child_bathing
      t.string :parking
      t.string :image
      t.text :spa_url

      t.timestamps
    end
    add_index :spas, [:name], unique: true
  end
end
