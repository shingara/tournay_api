# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

# Yellow card level 1

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 1,
  :name => 'Architecte',
  :card_type => 'people',
  :action => CardAction.new(
    :color_effect => Color.new(:grey),
    :around => true,
    :in_activate => false,
    :in_place => true,
    :on_people => false,
    :on_building => true,
    :win => true,
    :denier => 1
  )
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 1,
  :name => 'Echevin',
  :card_type => 'people',
  :action => CardAction.new(
    :color_effect => Color.new(:grey),
    :around => true,
    :in_activate => false,
    :in_place => true,
    :on_people => true,
    :on_building => false,
    :win => true,
    :denier => 2
  )
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 1,
  :name => 'Habitation',
  :card_type => 'building',
  :action => CardAction.new(
    :color_effect => Color.new(:yellow),
    :around => false,
    :in_activate => false,
    :in_place => false,
    :on_people => false,
    :on_building => false,
    :win => false,
    :denier => 3,
    :cost => true,
    :buy => :citizen
  )
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 1,
  :name => 'Carrière',
  :card_type => 'building',
  :action => CardAction.new(
    :color_effect => nil,
    :around => false,
    :in_activate => false,
    :in_place => false,
    :on_people => false,
    :on_building => false,
    :win => true,
    :denier => 4,
    :cost => false,
    :buy => :nothing
  )
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:yellow),
  :victory_point => 0,
  :level => 1,
  :name => 'Ferme',
  :card_type => 'building',
  :action => CardAction.new(
    :color_effect => nil,
    :around => false,
    :in_activate => false,
    :in_place => false,
    :on_people => false,
    :on_building => false,
    :win => true,
    :denier => 1,
    :cost => false,
    :buy => :empty_neighborhood
  )
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:yellow),
  :victory_point => 0,
  :level => 1,
  :name => 'Marché',
  :card_type => 'building',
  :action => CardAction.new(
    :color_effect => nil,
    :around => false,
    :in_activate => false,
    :in_place => false,
    :on_people => false,
    :on_building => false,
    :win => true,
    :denier => 5,
    :cost => false,
    :buy => :nothing
  )
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 1,
  :name => 'Compagnon',
  :card_type => 'people',
  :action => CardAction.new(
    :color_effect => Color.new(:grey),
    :around => true,
    :in_activate => true,
    :in_place => false,
    :on_people => false,
    :on_building => true,
    :win => true,
    :denier => 1,
    :cost => false,
    :buy => :nothing
  )
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 1,
  :name => 'Grange',
  :card_type => 'building',
  :action => CardAction.new(
    :color_effect => Color.new(:yellow),
    :around => false,
    :in_activate => false,
    :in_place => false,
    :on_people => false,
    :on_building => false,
    :win => true,
    :denier => 0,
    :cost => false,
    :buy => :one_card_level_2
  )
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 1,
  :name => 'Port',
  :card_type => 'building',
  :action => CardAction.new(
    :color_effect => Color.new(:yellow),
    :around => false,
    :in_activate => false,
    :in_place => false,
    :on_people => false,
    :on_building => false,
    :win => true,
    :denier => 0,
    :cost => false,
    :buy => :copy_building_not_activate
  )
})

# White card level 1

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:white),
  :victory_point => 1,
  :level => 1,
  :name => 'Bibliotheque',
  :card_type => 'building',
  :action => CardAction.new(
    :color_effect => Color.new(:grey),
    :around => false,
    :in_activate => false,
    :in_place => false,
    :on_people => false,
    :on_building => false,
    :win => true,
    :denier => 0,
    :cost => false,
    :buy => :one_card_level_2
  )
})

