class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :power
      t.integer :toughness
      t.string :number, null: false
      t.string :image
      t.references :color

      t.timestamps

      t.index :name
      t.index :power
      t.index :toughness
      t.index :number, unique: true
    end
  end
end
