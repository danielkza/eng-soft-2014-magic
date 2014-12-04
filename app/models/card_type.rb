class CardType < ActiveRecord::Base
  has_and_belongs_to_many :cards, uniq: true

  validates :name, length: { minimum: 2 }
  validates_uniqueness_of :name, case_sensitive: false
end
