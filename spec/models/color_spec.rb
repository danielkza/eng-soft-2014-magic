require 'rails_helper'

RSpec.describe Color, :type => :model do
  before do
    @blue = Color.find_by_name('Blue')
  end

  it 'has a correct symbol' do
    expect(@blue.to_sym).to eq(:blue)
  end

  it 'is unique' do
    expect(Color.create(name: 'blue').errors).to include(:name)
  end

  it 'has lands by their color' do
    land = create(:blue_land)
    expect(@blue.cards).to include(land)
  end

  it 'has cards by their mana cost' do
    creature = create(:blue_basic_human_creature)
    expect(@blue.cards).to include(creature)
  end
end
