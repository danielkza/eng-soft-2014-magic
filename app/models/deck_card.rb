class DeckCard < ActiveRecord::Base
  belongs_to :card
  belongs_to :deck

  validates :amount, numericality: { greater_than: 0 }
end
