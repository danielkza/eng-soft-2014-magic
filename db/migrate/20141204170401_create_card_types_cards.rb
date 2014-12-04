class CreateCardTypesCards < ActiveRecord::Migration
  def change
    create_table :card_types_cards, id: false do |t|
      t.references :card, null: false
      t.references :card_type, null: false

      t.index [:card_id, :card_type_id], unique: true
      t.index :card_type_id
    end
  end
end
