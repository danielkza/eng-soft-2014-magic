class CreateCardSuperTypes < ActiveRecord::Migration
  def change
    create_table :card_super_types do |t|
      t.string :name, null: false

      t.index :name, unique: true
    end
  end
end
