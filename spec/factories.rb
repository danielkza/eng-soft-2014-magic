FactoryGirl.define do  factory :deck_card do
    
  end
  factory :deck do
    user nil
name "MyString"
cards ""
  end
  factory :user do
    
  end

   factory :card_mana_cost do
    factory :blue_mana_cost do
      color { Color.find_by_sym(:blue) }
      amount 2
    end

    factory :green_mana_cost do
      color { Color.find_by_sym(:green) }
      amount 2
    end
  end

  factory :card do
    sequence(:number) { |n| (1000 + n).to_s }

    factory :blue_basic_human_creature do
      sequence(:name) { |n| "Creature #{n}" }
      power 1
      toughness 1

      super_types { [CardSuperType.find_by_sym!(:basic)] }
      types       { [CardType.find_by_sym!(:creature)] }
      sub_types   { [CardSubType.find_by_sym!(:human)] }

      after(:create) do |card|
        create(:blue_mana_cost, card: card)
      end
    end

    factory :blue_land do
      sequence(:name) { |n| "Land #{n}" }
      power nil
      toughness nil

      super_types { [CardSuperType.find_by_sym(:basic)] }
      types       { [CardType.find_by_sym(:land)] }

      after(:create) do |card|
        create(:blue_mana_cost, amount: nil, card: card)
      end
    end

    factory :blue_green_legendary_enchantment do
      sequence(:name) { |n| "Test Enchantment #{n}" }
      power nil
      toughness nil

      super_types { [CardSuperType.find_by_sym(:legendary)] }
      types       { [CardType.find_by_sym(:enchantment)] }

      after(:create) do |card|
        create(:blue_mana_cost, card: card)
        create(:green_mana_cost, card: card)
      end
    end
  end
end
