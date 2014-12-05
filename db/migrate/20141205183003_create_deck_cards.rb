class CreateDeckCards  < ActiveRecord::Migration
  def change
    create_table :deck_cards, id: false do |t|
      t.references :card, null: false
      t.references :deck, null: false
      t.integer :amount, null: false

      t.index [:card_id, :deck_id], unique: true
      t.index :deck_id
    end
  end
end
