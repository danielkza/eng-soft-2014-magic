module NameToSymAble
  extend ActiveSupport::Concern

  def to_sym
    name.downcase.parameterize.underscore.to_sym
  end

  module ClassMethods
    def find_by_sym(sym)
      find_by('lower(name) = ?', sym.to_s)
    end

    def find_by_sym!(sym)
      find_by!('lower(name) = ?', sym.to_s)
    end
  end
end
