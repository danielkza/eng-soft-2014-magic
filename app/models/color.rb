class Color < ActiveRecord::Base
  has_many :card_mana_costs
  has_many :cards_with_mana_cost, class_name: 'Card', through: :card_mana_costs
  has_many :cards_with_color, class_name: 'Card'

  def cards
    cards_with_color.merge(cards_with_mana_cost)
  end

  validates :name, length: { minimum: 2 }
  validates :land, length: { minimum: 2 }
  validates :name, uniqueness: { case_sensitive: false }

  def to_sym
    name.downcase.to_sym
  end
end
