class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :name, null: false
      t.string :land

      t.index :name, unique: true
    end
  end
end
