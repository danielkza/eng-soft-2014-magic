class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :cards, class: 'DeckCard', autosave: true, dependent: :destroy

  def add_card(card)
    existing = cards.find(card: card)
    if existing
      existing.amount += 1
      existing.save
    else
      deck_cards.create(card: card, amount: 1)
    end

    self
  end

  def remove_card(card)
    existing = cards.find(card: card)
    if existing
      existing.amount -= 1
      if existing.amount == 0
        existing.delete
      else
        existing.save
      end
    end

    self
  end
end
