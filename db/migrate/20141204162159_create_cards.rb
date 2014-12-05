class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name, null: false
      t.string :text
      t.string :flavor
      t.string :rarity
      t.integer :power
      t.integer :toughness
      t.string :number, null: false
      t.string :image

      t.timestamps

      t.index :name
      t.index :rarity
      t.index :power
      t.index :toughness
      t.index :number, unique: true
    end
  end
end
