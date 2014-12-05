# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Color.create!([
  {name: 'Blue',  land: 'Island'},
  {name: 'White', land: 'Plain'},
  {name: 'Black', land: 'Swamp'},
  {name: 'Red',   land: 'Mountain'},
  {name: 'Green', land: 'Forest'}
])

CardSuperType.create!(%w(
  Basic Elite Legendary Ongoing Snow World
).map { |t| {name: t} })

CardType.create!(%w(
  Artifact Creature Enchantment Instant Land Planeswalker Tribal Sorcery
).map { |t| {name: t} })

subtypes = [
  'Advisor', 'Ajani', 'Ally', 'Angel', 'Anteater', 'Antelope', 'Ape', 'Arcane',
  'Archer', 'Archon', 'Artificer', 'Ashiok', 'Assassin', 'Assembly', 'Atog',
  'Aura', 'Aurochs', 'Avatar', 'Badger', 'Barbarian', 'Basilisk', 'Bat', 'Bear',
  'Beast', 'Beeble', 'Berserker', 'Bird', 'Boar', 'Bolas', 'Bringer', 'Brushwagg',
  'Bureaucrat', 'Camel', 'Carrier', 'Cat', 'Centaur', 'Cephalid', 'Chandra',
  'Chicken', 'Child', 'Chimera', 'Clamfolk', 'Cleric', 'Cockatrice',
  'Construct', 'Cow', 'Crab', 'Crocodile', 'Curse', 'Cyclops', 'Dack', 'Dauthi',
  'Demon', 'Desert', 'Designer', 'Devil', 'Dinosaur', 'Djinn', 'Domri', 'Donkey',
  'Dragon', 'Drake', 'Dreadnought', 'Drone', 'Druid', 'Dryad', 'Dwarf', 'Efreet',
  'Egg', 'Elder', 'Eldrazi', 'Elemental', 'Elephant', 'Elf', 'Elk', 'Elspeth',
  'Elves', 'Equipment', 'Eye', 'Faerie', 'Ferret', 'Fish', 'Flagbearer',
  'Forest', 'Fortification', 'Fox', 'Frog', 'Fungus', 'Gamer', 'Gargoyle',
  'Garruk', 'Gate', 'Giant', 'Gideon', 'Gnome', 'Goat', 'Goblin', 'Goblins',
  'God', 'Golem', 'Gorgon', 'Gremlin', 'Griffin', 'Gus', 'Hag', 'Harpy',
  'Hellion', 'Hero', 'Hippo', 'Hippogriff', 'Homarid', 'Homunculus', 'Horror',
  'Horse', 'Hound', 'Human', 'Hydra', 'Hyena', 'Igpay', 'Illusion', 'Imp',
  'Incarnation', 'Insect', 'Island', 'Jace', 'Jellyfish', 'Juggernaut', 'Karn',
  'Kavu', 'Kiora', 'Kirin', 'Kithkin', 'Knight', 'Kobold', 'Kor', 'Koth',
  'Kraken', 'Lady of Proper Etiquette', 'Lair', 'Lamia', 'Lammasu', 'Leech',
  'Legend', 'Leviathan', 'Lhurgoyf', 'Licid', 'Liliana', 'Lizard', 'Locus',
  'Lord', 'Manticore', 'Masticore', 'Mercenary', 'Merfolk', 'Metathran', 'Mime',
  'Mine', 'Minion', 'Minotaur', 'Monger', 'Mongoose', 'Monk', 'Moonfolk',
  'Mountain', 'Mummy', 'Mutant', 'Myr', 'Mystic', 'Naga', 'Nautilus', 'Nephilim',
  'Nightmare', 'Nightstalker', 'Ninja', 'Nissa', 'Noggle', 'Nomad', 'Nymph',
  'Octopus', 'Ogre', 'Ooze', 'Orc', 'Orgg', 'Ouphe', 'Ox', 'Oyster',
  'Paratrooper', 'Pegasus', 'Pest', 'Phelddagrif', 'Phoenix', 'Pirate',
  'Plains', 'Plant', 'Power', 'Praetor', 'Rabbit', 'Ral', 'Rat', 'Rebel',
  'Rhino', 'Rigger', 'Rogue', 'Sable', 'Salamander', 'Samurai', 'Saproling',
  'Sarkhan', 'Satyr', 'Scarecrow', 'Scorpion', 'Scout', 'Serpent', 'Shade',
  'Shaman', 'Shapeshifter', 'Sheep', 'Ship', 'Shrine', 'Siren', 'Skeleton',
  'Slith', 'Sliver', 'Slug', 'Snake', 'Soldier', 'Soltari', 'Sorin', 'Specter',
  'Spellshaper', 'Sphinx', 'Spider', 'Spike', 'Spirit', 'Sponge', 'Squid',
  'Squirrel', 'Starfish', 'Surrakar', 'Swamp', 'Tamiyo', 'Tezzeret', 'Thalakos',
  'Thopter', 'Thrull', 'Tibalt', 'Tower', 'Townsfolk', 'Trap', 'Treefolk',
  'Troll', 'Turtle', 'Unicorn', "Urza's", 'Vampire', 'Vedalken', 'Venser',
  'Viashino', 'Volver', 'Vraska', 'Waiter', 'Wall', 'Warrior', 'Weird',
  'Werewolf', 'Whale', 'Wizard', 'Wolf', 'Wolverine', 'Wombat', 'Worm',
  'Wraith', 'Wurm', 'Xenagos', 'Yeti', 'Zombie', 'Zubera'
]

CardSubType.create!(subtypes.map { |t| {name: t} })

Card.new(name: 'Liliana of Veil', number: '1000').tap do |c|
  c.add_type(:planeswalker)
  c.add_mana_cost(nil, 1)
  c.add_mana_cost(:black, 2)
  c.save!
end

