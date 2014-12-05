module NameableType
  extend ActiveSupport::Concern
  include NameToSymAble

  included do
    has_and_belongs_to_many :cards, uniq: true

    validates :name, length: { minimum: 2 },
              uniqueness: { case_sensitive: false }
  end
end
