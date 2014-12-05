class CreateCardSubTypes < ActiveRecord::Migration
  def change
    create_table :card_sub_types do |t|
      t.string :name, null: false

      t.index :name, unique: true
    end
  end
end
