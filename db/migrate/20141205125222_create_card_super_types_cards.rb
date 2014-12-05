class CreateCardSuperTypesCards < ActiveRecord::Migration
  def change
    create_table :card_super_types_cards, id: false do |t|
      t.references :card, null: false
      t.references :card_super_type, null: false

      t.index [:card_id, :card_super_type_id], unique: true
      t.index :card_super_type_id
    end
  end
end
