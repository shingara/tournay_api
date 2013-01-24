# encoding: utf-8
#
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
  :when => When::InPlaceAround.new(
    :building => true,
    :prestige => true,
    :colors => [ Color.new(:grey) ]
  ),
  :action => Actions::GetDenier.new(:num => 1)
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 1,
  :name => 'Echevin',
  :card_type => 'people',
  :when => When::InPlaceAround.new(
    :people => true,
    :colors => [ Color.new(:grey) ]
  ),
  :action => Actions::GetDenier.new(:num => 2)
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 1,
  :name => 'Habitation',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetCitizen.new(
    :cost => 3,
    :color => Color.new(:yellow)
  )
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 1,
  :name => 'Carrière',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetDenier.new(:num => 4)
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:yellow),
  :victory_point => 0,
  :level => 1,
  :name => 'Ferme',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetDenierByEmptyNeighborhood.new(:num => 1)
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:yellow),
  :victory_point => 0,
  :level => 1,
  :name => 'Marché',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetDenier.new(:num => 5)
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 1,
  :name => 'Compagnon',
  :card_type => 'people',
  :when => When::InActivateAround.new(:colors => [Color.new(:grey)], :building => true),
  # :action => CardAction.new(
  #   :color_effect => Color.new(:grey),
  #   :around => true,
  #   :in_activate => true,
  #   :on_building => true,
  #   :win => true,
  #   :denier => 1,
  # )
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 1,
  :name => 'Grange',
  :card_type => 'building',
  :when => When::InActivate.new
  # :action => CardAction.new(
  #   :color_effect => Color.new(:yellow),
  #   :get_one_card_on => 2
  # )
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 1,
  :name => 'Port',
  :card_type => 'building',
  :when => When::InActivate.new
  # :action => CardAction.new(
  #   :color_effect => Color.new(:yellow),
  #   :copy_action_not_activate => true
  # )
})

# White card level 1

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:white),
  :victory_point => 1,
  :level => 1,
  :name => 'Bibliotheque',
  :card_type => 'building',
  :when => When::InActivate.new
  # :action => CardAction.new(
  #   :color_effect => Color.new(:grey),
  #   :get_one_card_on => 2
  # )
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:white),
  :victory_point => 1,
  :level => 1,
  :name => 'Eveque',
  :card_type => 'people',
  # :action => CardAction.new(
  #   :color_effect => Color.new(:white),
  #   :get_back_citizen_in_place => true,
  #   :around => true,
  #   :in_activate => true,
  #   :on_building => true,
  # )
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:white),
  :victory_point => 0,
  :level => 1,
  :name => 'Pont',
  :card_type => 'building',
  :when => When::InActivate.new,
  # :action => CardAction.new(
  #   :color_effect => Color.new(:grey),
  #   :copy_action_not_activate => true,
  # )
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:white),
  :victory_point => 0,
  :level => 1,
  :name => 'Bibliothéque',
  :card_type => 'building',
  :when => When::InActivate.new,
  # :action => CardAction.new(
  #   :color_effect => Color.new(:grey),
  #   :get_two_card_on => 1,
  # )
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:white),
  :victory_point => 0,
  :level => 1,
  :name => 'Bibliothéque',
  :card_type => 'building',
  :when => When::InActivate.new,
  # :action => CardAction.new(
  #   :color_effect => Color.new(:grey),
  #   :get_two_card_on => 1,
  # )
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:white),
  :victory_point => 1,
  :level => 1,
  :name => 'Hopital',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetDenier.new(:num => 4)
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:white),
  :victory_point => 1,
  :level => 1,
  :name => 'Pretre',
  :card_type => 'people',
  # :action => CardAction.new(
  #   :color_effect => Color.new(:white),
  #   :around => true,
  #   :twice_activate => true
  # )
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:white),
  :victory_point => 0,
  :level => 1,
  :name => 'Eveché',
  :card_type => 'building',
  :when => When::InActivate.new,
  # :action => CardAction.new(
  #   :color_effect => Color.new(:white),
  #   :get_two_card_on => 2
  # )
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:white),
  :victory_point => 0,
  :level => 1,
  :name => 'Monastere',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetCitizen.new(
    :cost => 3,
    :color => Color.new(:grey)
  )
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:white),
  :victory_point => 0,
  :level => 1,
  :name => 'Prieur',
  :card_type => 'people',
  # :action => CardAction.new(
  #   :color_effect => Color.new(:grey),
  #   :around => true,
  #   :in_activate => true,
  #   :on_building => true,
  #   :win => true,
  #   :denier => 2
  # )
})

# Red card level 1

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:red),
  :victory_point => 1,
  :level => 1,
  :name => 'Arsenal',
  :card_type => 'building',
  :when => When::InActivate.new,
  # :action => CardAction.new(
  #   :color_effect => Color.new(:red),
  #   :get_one_card_on => 2
  # )
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:red),
  :victory_point => 1,
  :level => 1,
  :name => 'Caserne',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetCitizen.new(
    :cost => 3,
    :color => Color.new(:red)
  )
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:red),
  :victory_point => 1,
  :level => 1,
  :name => 'Port',
  :card_type => 'building',
  :when => When::InActivate.new,
  # :action => CardAction.new(
  #   :color_effect => Color.new(:red),
  #   :against_event_fill => 1
  # )
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:red),
  :victory_point => 1,
  :level => 1,
  :name => 'Avoué',
  :card_type => 'people',
  :when => When::InPlaceAround.new(
    :building => true,
    :colors => [ Color.new(:white), Color.new(:yellow) ]
  ),
  :action => Actions::GetDenier.new(:num => 2)
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:red),
  :victory_point => 1,
  :level => 1,
  :name => 'Chevalier',
  :card_type => 'people',
  # :action => CardAction.new(
  #   :color_effect => Color.new(:grey),
  #   :around => true,
  #   :in_place => true,
  #   :on_prestige => true,
  #   :against_event_fill => true,
  #   :get_event_denier => true
  # )
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:red),
  :victory_point => 1,
  :level => 1,
  :name => 'Percepteur',
  :card_type => 'people',
  # :action => CardAction.new(
  #   :color_effect => Color.new(:yellow),
  #   :around => true,
  #   :in_activate => true,
  #   :on_building => true,
  #   :denier => 1
  # )
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:red),
  :victory_point => 1,
  :level => 1,
  :name => 'Baliste',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::PutDenierOnEvent.new(:num => 2),
})

