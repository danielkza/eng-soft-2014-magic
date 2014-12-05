class Color < ActiveRecord::Base
  include NameToSymAble

  has_many :card_mana_costs
  has_many :cards, through: :card_mana_costs

  validates :name, length: { minimum: 2 }, uniqueness: { case_sensitive: false }
  validates :land, length: { minimum: 2 }
end
