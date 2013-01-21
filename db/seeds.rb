# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 1,
  :name => 'Architecte',
  :active => false,
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
  :active => false,
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
  :active => false,
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
