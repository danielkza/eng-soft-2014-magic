# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Color.create([
  {name: 'Blue',  land: 'Island'},
  {name: 'White', land: 'Plain'},
  {name: 'Black', land: 'Swamp'},
  {name: 'Red',   land: 'Mountain'},
  {name: 'Green', land: 'Forest'}
])

CardType.create(%w(
  Artifact Creature Enchantment Instant Land Planeswalke Tribal Sorcery
).map { |t| {name: t} })
