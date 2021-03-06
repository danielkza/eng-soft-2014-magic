class CreateCardManaCosts < ActiveRecord::Migration
  def change
    create_table :card_mana_costs, id: false do |t|
      t.references :card, null: false
      t.references :color
      t.integer :amount

      t.index [:card_id, :color_id], unique: true
      t.index :color_id
    end
  end
end
