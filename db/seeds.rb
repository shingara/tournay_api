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
  :action => Actions::GetDenier.new(:num => 1),
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 1,
  :name => 'Grange',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetCard.new(:num => 1, :level => 2, :color => Color.new(:yellow))
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 1,
  :name => 'Port',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::CopyCard.new(:color => Color.new(:yellow), :activate => false, :building => true)
})

# White card level 1

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:white),
  :victory_point => 1,
  :level => 1,
  :name => 'Bibliotheque',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetCard.new(:color => Color.new(:grey), :level => 2)
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:white),
  :victory_point => 1,
  :level => 1,
  :name => 'Evêque',
  :card_type => 'people',
  :when => When::InActivateAround.new(:colors => [Color.new(:white)]),
  :action => Actions::CollectCitizen.new(:on_place => true, :on_neighborhood => false)
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:white),
  :victory_point => 0,
  :level => 1,
  :name => 'Pont',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::CopyCard.new(:color => Color.new(:grey), :activate => false, :building => true)
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:white),
  :victory_point => 0,
  :level => 1,
  :name => 'Bibliothéque',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetCard.new(:num => 2, :level => 1, :color => Color.new(:grey))
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
  :when => When::InPlaceAround.new(:colors => [Color.new(:white)]),
  :action => Actions::TwiceActivate.new
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:white),
  :victory_point => 0,
  :level => 1,
  :name => 'Eveché',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetCard.new(:color => Color.new(:white), :num => 2, :level => 2)
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
  :when => When::InActivateAround.new(:colors => [Color.new(:white)], :building => true),
  :action => Actions::GetDenier.new(:num => 2)
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
  :action => Actions::GetCard.new(:level => 2, :num => 1, :color => Color.new(:red)),
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
  :action => Actions::AgainstEvent.new(:with_denier => 1)
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
  :when => When::InPlaceAround.new(:prestige => true, :colors => [Color.new(:grey)]),
  :action => Actions::AgainstEvent.new(:with_denier => true, :get_denier => true)
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:red),
  :victory_point => 1,
  :level => 1,
  :name => 'Percepteur',
  :card_type => 'people',
  :when => When::InActivateAround.new(:colors => [Color.new(:yellow)], :building => true),
  :action => Actions::GetDenier.new(:num => 1)
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

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:red),
  :victory_point => 1,
  :level => 1,
  :name => 'Fort',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::AgainstEvent.new(:with_denier => 1)
})

NeighborhoodCard.create!({
  :cost => 1,
  :color => Color.new(:red),
  :victory_point => 1,
  :level => 1,
  :name => 'Route',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::CopyCard.new(:color => Color.new(:red), :building => true)
})

# Yellow card level 2

NeighborhoodCard.create!({
  :cost => 3,
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 1,
  :name => 'Architecte',
  :card_type => 'people',
  :when => When::InPlaceAround.new(:building => true, :prestige => true, :colors => [Color.new(:grey)]),
  :action => Actions::GetDenier.new(:num => 2)
})

NeighborhoodCard.create!({
  :cost => 3,
  :color => Color.new(:yellow),
  :victory_point => 2,
  :level => 1,
  :name => 'Echevin',
  :card_type => 'people',
  :when => When::InPlaceAround.new(:people => true, :colors => [Color.new(:grey)]),
  :action => Actions::GetDenier.new(:num => 4)
})

NeighborhoodCard.create!({
  :cost => 3,
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 1,
  :name => 'Marché',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetDenier.new(:num => 6)
})

NeighborhoodCard.create!({
  :cost => 3,
  :color => Color.new(:yellow),
  :victory_point => 2,
  :level => 1,
  :name => 'Carriére',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetDenier.new(:num => 5)
})

NeighborhoodCard.create!({
  :cost => 3,
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 1,
  :name => 'Grange',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetCard.new(:num => 1, :level => 3, :color => Color.new(:yellow))
})

NeighborhoodCard.create!({
  :cost => 3,
  :color => Color.new(:yellow),
  :victory_point => 0,
  :level => 1,
  :name => 'Péage',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetDenierByFillNeighborhood.new(:num => 1)
})

NeighborhoodCard.create!({
  :cost => 3,
  :color => Color.new(:yellow),
  :victory_point => 0,
  :level => 1,
  :name => 'Compagnon',
  :card_type => 'people',
  :when => When::InActivateAround.new(:building => true, :colors => [Color.new(:grey)]),
  :action => Actions::GetDenier.new(:num => 2)
})

NeighborhoodCard.create!({
  :cost => 3,
  :color => Color.new(:yellow),
  :victory_point => 2,
  :level => 1,
  :name => 'Habitation',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetCitizen.new(:cost => 2, :color => Color.new(:yellow))
})

NeighborhoodCard.create!({
  :cost => 3,
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 1,
  :name => 'Port',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::CopyCard.new(:activate => true, :building => true, :color => Color.new(:yellow))
})

# White card level 2
