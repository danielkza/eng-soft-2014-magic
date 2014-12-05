require 'rails_helper'

RSpec.describe CardManaCost, :type => :model do
  it 'has either a color, an amount or both' do
    card = create(:blue_basic_human_creature)
    expect(card.mana_costs.create(color: nil, amount: nil).errors).not_to be_empty
  end
end
