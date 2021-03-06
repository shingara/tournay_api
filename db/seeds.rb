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
  :cost => Cost.new(:denier => 1),
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
  :cost => Cost.new(:denier => 1),
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
  :cost => Cost.new(:denier => 1),
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
  :cost => Cost.new(:denier => 1),
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 1,
  :name => 'Carrière',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetDenier.new(:num => 4)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 1),
  :color => Color.new(:yellow),
  :victory_point => 0,
  :level => 1,
  :name => 'Ferme',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetDenierByEmptyNeighborhood.new(:num => 1)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 1),
  :color => Color.new(:yellow),
  :victory_point => 0,
  :level => 1,
  :name => 'Marché',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetDenier.new(:num => 5)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 1),
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 1,
  :name => 'Compagnon',
  :card_type => 'people',
  :when => When::InActivateAround.new(:colors => [Color.new(:grey)], :building => true),
  :action => Actions::GetDenier.new(:num => 1),
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 1),
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 1,
  :name => 'Grange',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetCard.new(:num => 1, :level => 2, :color => Color.new(:yellow))
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 1),
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
  :cost => Cost.new(:denier => 1),
  :color => Color.new(:white),
  :victory_point => 1,
  :level => 1,
  :name => 'Bibliotheque',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetCard.new(:color => Color.new(:grey), :level => 2)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 1),
  :color => Color.new(:white),
  :victory_point => 1,
  :level => 1,
  :name => 'Evêque',
  :card_type => 'people',
  :when => When::InActivateAround.new(:colors => [Color.new(:white)]),
  :action => Actions::CollectCitizen.new(:on_place => true, :on_neighborhood => false)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 1),
  :color => Color.new(:white),
  :victory_point => 0,
  :level => 1,
  :name => 'Pont',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::CopyCard.new(:color => Color.new(:grey), :activate => false, :building => true)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 1),
  :color => Color.new(:white),
  :victory_point => 0,
  :level => 1,
  :name => 'Bibliothéque',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetCard.new(:num => 2, :level => 1, :color => Color.new(:grey))
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 1),
  :color => Color.new(:white),
  :victory_point => 1,
  :level => 1,
  :name => 'Hopital',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetDenier.new(:num => 4)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 1),
  :color => Color.new(:white),
  :victory_point => 1,
  :level => 1,
  :name => 'Prêtre',
  :card_type => 'people',
  :when => When::InPlaceAround.new(:colors => [Color.new(:white)]),
  :action => Actions::TwiceActivate.new
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 1),
  :color => Color.new(:white),
  :victory_point => 0,
  :level => 1,
  :name => 'Eveché',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetCard.new(:color => Color.new(:white), :num => 2, :level => 2)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 1),
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
  :cost => Cost.new(:denier => 1),
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
  :cost => Cost.new(:denier => 1),
  :color => Color.new(:red),
  :victory_point => 1,
  :level => 1,
  :name => 'Arsenal',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetCard.new(:level => 2, :num => 1, :color => Color.new(:red)),
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 1),
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
  :cost => Cost.new(:denier => 1),
  :color => Color.new(:red),
  :victory_point => 1,
  :level => 1,
  :name => 'Port',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::AgainstEvent.new(:with_denier => 1, :num => 1)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 1),
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
  :cost => Cost.new(:denier => 1),
  :color => Color.new(:red),
  :victory_point => 1,
  :level => 1,
  :name => 'Chevalier',
  :card_type => 'people',
  :when => When::InPlaceAround.new(:prestige => true, :colors => [Color.new(:grey)]),
  :action => Actions::AgainstEvent.new(:with_denier => true, :get_denier => true, :num => 1)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 1),
  :color => Color.new(:red),
  :victory_point => 1,
  :level => 1,
  :name => 'Percepteur',
  :card_type => 'people',
  :when => When::InActivateAround.new(:colors => [Color.new(:yellow)], :building => true),
  :action => Actions::GetDenier.new(:num => 1)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 1),
  :color => Color.new(:red),
  :victory_point => 1,
  :level => 1,
  :name => 'Baliste',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::PutDenierOnEvent.new(:num => 2),
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 1),
  :color => Color.new(:red),
  :victory_point => 1,
  :level => 1,
  :name => 'Fort',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::AgainstEvent.new(:with_denier => 1, :num => 1)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 1),
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
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 2,
  :name => 'Architecte',
  :card_type => 'people',
  :when => When::InPlaceAround.new(:building => true, :prestige => true, :colors => [Color.new(:grey)]),
  :action => Actions::GetDenier.new(:num => 2)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:yellow),
  :victory_point => 2,
  :level => 2,
  :name => 'Echevin',
  :card_type => 'people',
  :when => When::InPlaceAround.new(:people => true, :colors => [Color.new(:grey)]),
  :action => Actions::GetDenier.new(:num => 4)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 2,
  :name => 'Marché',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetDenier.new(:num => 6)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:yellow),
  :victory_point => 2,
  :level => 2,
  :name => 'Carriére',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetDenier.new(:num => 5)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 1),
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 2,
  :name => 'Grange',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetCard.new(:num => 1, :level => 3, :color => Color.new(:yellow))
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:yellow),
  :victory_point => 0,
  :level => 2,
  :name => 'Péage',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetDenierByFillNeighborhood.new(:num => 1)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:yellow),
  :victory_point => 0,
  :level => 2,
  :name => 'Compagnon',
  :card_type => 'people',
  :when => When::InActivateAround.new(:building => true, :colors => [Color.new(:grey)]),
  :action => Actions::GetDenier.new(:num => 2)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:yellow),
  :victory_point => 2,
  :level => 2,
  :name => 'Habitation',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetCitizen.new(:cost => 2, :color => Color.new(:yellow))
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:yellow),
  :victory_point => 1,
  :level => 2,
  :name => 'Port',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::CopyCard.new(:activate => true, :building => true, :color => Color.new(:yellow))
})

# White card level 2

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:white),
  :victory_point => 2,
  :level => 2,
  :name => 'Augustin',
  :card_type => 'people',
  :when => When::InPlaceAround.new(:colors => [Color.new(:white)], :building => true, :people => true),
  :action => Actions::GetDenier.new(:num => 2)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:white),
  :victory_point => 1,
  :level => 2,
  :name => 'Evêché',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetCard.new(:level => 3, :num => 1, :color => Color.new(:white))
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:white),
  :victory_point => 0,
  :level => 2,
  :name => 'Pont',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::CopyCard.new(:color => Color.new(:grey), :building => true, :activate => true)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:white),
  :victory_point => 0,
  :level => 2,
  :name => 'Bibliothèque',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetCard.new(:level => 3, :color => Color.new(:grey), :num => 1)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:white),
  :victory_point => 2,
  :level => 2,
  :name => 'Monastère',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetCitizen.new(:cost=> 2, :color => Color.new(:white))
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:white),
  :victory_point => 1,
  :level => 2,
  :name => 'Prêtre',
  :card_type => 'people',
  :when => When::InPlaceAround.new(:colors => [Color.new(:grey)]),
  :action => Actions::TwiceActivate.new
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:white),
  :victory_point => 0,
  :level => 2,
  :name => 'Bibliothèque',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetCard.new(:num => 2, :level => 2, :color => Color.new(:grey))
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:white),
  :victory_point => 0,
  :level => 2,
  :name => 'Monastère',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetCitizen.new(:cost => 2, :color => Color.new(:grey))
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:white),
  :victory_point => 0,
  :level => 2,
  :name => 'Prieur',
  :card_type => 'building',
  :when => When::InActivateAround.new(:colors => [Color.new(:white)], :building => true),
  :action => Actions::GetDenier.new(:num => 3)
})

# Red card level 2

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:red),
  :victory_point => 1,
  :level => 2,
  :name => 'Arsenal',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetCard.new(:num => 1, :color => Color.new(:red), :level => 3)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:red),
  :victory_point => 1,
  :level => 2,
  :name => 'Bastion',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::AgainstEvent.new(:num => 1)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:red),
  :victory_point => 1,
  :level => 2,
  :name => 'Port',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::AgainstEvent.new(:num => 1, :get_denier => true, :with_denier => true)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:red),
  :victory_point => 2,
  :level => 2,
  :name => 'Avoué',
  :card_type => 'people',
  :when => When::InPlaceAround.new(:colors => [Color.new(:white), Color.new(:yellow)], :building => true),
  :action => Actions::GetDenier.new(:num => 3)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:red),
  :victory_point => 2,
  :level => 2,
  :name => 'Caserne',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::GetCitizen.new(:cost => 2, :color => Color.new(:red))
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:red),
  :victory_point => 1,
  :level => 2,
  :name => 'Route',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::CopyCard.new(:color => Color.new(:red), :activate => true, :building => true)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:red),
  :victory_point => 2,
  :level => 2,
  :name => 'Baliste',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::PutDenierOnEvent.new(:num => 3)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:red),
  :victory_point => 1,
  :level => 2,
  :name => 'Fort',
  :card_type => 'building',
  :when => When::InActivate.new,
  :action => Actions::AgainstEvent.new(:num => 1, :with_denier => true, :get_denier => true)
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 3),
  :color => Color.new(:red),
  :victory_point => 2,
  :level => 2,
  :name => 'Percepteur',
  :card_type => 'people',
  :when => When::InActivateAround.new(:color => Color.new(:yellow), :building => true),
  :action => Actions::GetDenier.new(:num => 2)
})

# Yellow card level 3

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 5),
  :color => Color.new(:yellow),
  :condition_victory_point => VictoryPoint.new(
    :own => 4,
    :other => 2,
    :condition => 'triple_neighborhood_color'
  ),
  :level => 3,
  :name => 'Beffroi',
  :card_type => 'prestige',
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 2, :card => 1),
  :color => Color.new(:yellow),
  :condition_victory_point => VictoryPoint.new(
    :own => 2,
    :other => 1,
    :condition => 'yellow_citizen'
  ),
  :level => 3,
  :name => 'Hotel de ville',
  :card_type => 'prestige',
})

NeighborhoodCard.create!({
  :cost => Cost.new(:citizen => 1, :color => Color.new(:yellow)),
  :color => Color.new(:yellow),
  :condition_victory_point => VictoryPoint.new(
    :own => 2,
    :other => 1,
    :condition => 'yellow_building_people'
  ),
  :level => 3,
  :name => 'Salle aux draps',
  :card_type => 'prestige',
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 5),
  :color => Color.new(:yellow),
  :condition_victory_point => VictoryPoint.new(
    :own => 2,
    :other => 1,
    :condition => 'grey_people',
  ),
  :level => 3,
  :name => 'Tours des six',
  :card_type => 'prestige',
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 5),
  :color => Color.new(:yellow),
  :condition_victory_point => VictoryPoint.new(
    :own => 2,
    :other => 1,
    :condition => 'by_4_denier',
  ),
  :level => 3,
  :name => 'Hotels des monnaies',
  :card_type => 'prestige',
})

# Level Card white 3

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 20),
  :color => Color.new(:white),
  :condition_victory_point => VictoryPoint.new(
    :own => 8,
    :condition => 'own',
  ),
  :level => 3,
  :name => 'Cathdrale',
  :card_type => 'prestige',
})

NeighborhoodCard.create!({
  :cost => Cost.new(:citizen => 1, :color => Color.new(:white)),
  :color => Color.new(:white),
  :condition_victory_point => VictoryPoint.new(
    :own => 2,
    :other => 1,
    :condition => 'white_building_people',
  ),
  :level => 3,
  :name => 'Saint-Jacques',
  :card_type => 'prestige',
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 2, :card => 1),
  :color => Color.new(:white),
  :condition_victory_point => VictoryPoint.new(
    :own => 2,
    :other => 1,
    :condition => 'grey_prestige',
  ),
  :level => 3,
  :name => 'La madeleine',
  :card_type => 'prestige',
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 5),
  :color => Color.new(:white),
  :condition_victory_point => VictoryPoint.new(
    :own => 3,
    :other => 1,
    :condition => 'triple_citizen_color',
  ),
  :level => 3,
  :name => 'Saint-Nicolas',
  :card_type => 'prestige',
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 5),
  :color => Color.new(:white),
  :condition_victory_point => VictoryPoint.new(
    :own => 4,
    :other => 2,
    :condition => 'triple_neighborhood_color',
  ),
  :level => 3,
  :name => 'Saint-Brice',
  :card_type => 'prestige',
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 2, :card => 1),
  :color => Color.new(:white),
  :condition_victory_point => VictoryPoint.new(
    :own => 2,
    :other => 1,
    :condition => 'white_citizen',
  ),
  :level => 3,
  :name => 'Saint-Brice',
  :card_type => 'prestige',
})

# Level Card red 3

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 5),
  :color => Color.new(:red),
  :condition_victory_point => VictoryPoint.new(
    :own => 3,
    :other => 1,
    :condition => 'triple_citizen_color',
  ),
  :level => 3,
  :name => 'Pont des trous',
  :card_type => 'prestige',
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 5),
  :color => Color.new(:red),
  :condition_victory_point => VictoryPoint.new(
    :own => 2,
    :other => 1,
    :condition => 'bulwark_card',
  ),
  :level => 3,
  :name => 'Tour Henri VIII',
  :card_type => 'prestige',
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 2, :card => 1),
  :color => Color.new(:red),
  :condition_victory_point => VictoryPoint.new(
    :own => 2,
    :other => 1,
    :condition => 'red_citizen',
  ),
  :level => 3,
  :name => 'Porte de la Bigne',
  :card_type => 'prestige',
})

NeighborhoodCard.create!({
  :cost => Cost.new(:citizen => 1, :color => Color.new(:red)),
  :color => Color.new(:red),
  :condition_victory_point => VictoryPoint.new(
    :own => 2,
    :other => 1,
    :condition => 'red_building_people',
  ),
  :level => 3,
  :name => 'Tour Saint Georges',
  :card_type => 'prestige',
})

NeighborhoodCard.create!({
  :cost => Cost.new(:denier => 5),
  :color => Color.new(:red),
  :condition_victory_point => VictoryPoint.new(
    :own => 2,
    :other => 1,
    :condition => 'white_or_red_building',
  ),
  :level => 3,
  :name => 'Tour d\'Arras',
  :card_type => 'prestige',
})


# Event card

EventCard.create!({
  :cost => Cost.new(
    :denier => 1,
    :citizen => 1,
    :color => Color.new(:red)
  ),
  :denier_total => 2,
  :name => 'Bataille de Bouvines',
  :event => Events::UnActivateCitizen.new(
    :color => Color.new(:red)
  )
})

EventCard.create!({
  :cost => Cost.new(
    :citizen => 2,
    :color => Color.new(:red)
  ),
  :denier_total => 4,
  :name => 'Bataille de Cassel',
  :event => Events::LostDenier.new(
    :num => 1,
  )
})

EventCard.create!({
  :cost => Cost.new(
    :citizen => 1,
    :color => Color.new(:yellow),
    :denier => 1
  ),
  :denier_total => 3,
  :name => 'Bataille de Courtrai',
  :event => Events::LostNeighborhood.new(
    :num => 1,
    :color => Color.new(:yellow),
    :building => true,
    :people => true
  )
})

EventCard.create!({
  :cost => Cost.new(
    :citizen => 2,
    :color => Color.new(:yellow),
  ),
  :denier_total => 3,
  :name => 'Brigandage',
  :event => Events::LostDenier.new(
    :num => 1,
  )
})

EventCard.create!({
  :cost => Cost.new(
    :citizen => 1,
    :color => Color.new(:yellow),
    :denier => 1
  ),
  :denier_total => 2,
  :name => 'Grande Peste',
  :event => Events::LostCitizen.new(
    :num => 1,
    :color => Color.new(:yellow)
  )
})



EventCard.create!({
  :cost => Cost.new(
    :citizen => 1,
    :color => Color.new(:white),
    :denier => 1
  ),
  :denier_total => 3,
  :name => 'Hérésie',
  :event => Events::LostNeighborhood.new(
    :num => 1,
    :color => Color.new(:white),
    :building => true,
    :people => true
  )
})

EventCard.create!({
  :cost => Cost.new(
    :citizen => 1,
    :color => Color.new(:red),
    :denier => 1
  ),
  :denier_total => 2,
  :name => 'Croisade',
  :event => Events::LostCitizen.new(
    :num => 1,
    :color => Color.new(:grey),
  )
})

EventCard.create!({
  :cost => Cost.new(
    :citizen => 1,
    :color => Color.new(:white),
    :denier => 1
  ),
  :denier_total => 2,
  :name => 'Excommunication',
  :event => Events::LostCitizen.new(
    :num => 1,
    :color => Color.new(:white),
  )
})

EventCard.create!({
  :cost => Cost.new(
    :citizen => 2,
    :color => Color.new(:white),
  ),
  :denier_total => 1,
  :name => 'Maraudage',
  :event => Events::LostDenier.new(
    :num => 1,
  )
})

EventCard.create!({
  :cost => Cost.new(
    :citizen => 1,
    :color => Color.new(:white),
    :denier => 1
  ),
  :denier_total => 2,
  :name => 'Attaque des normands',
  :event => Events::LostNeighborhood.new(
    :num => 1,
    :color => Color.new(:grey),
    :building => true,
    :people => true
  )
})

EventCard.create!({
  :cost => Cost.new(
    :citizen => 1,
    :color => Color.new(:red),
    :denier => 1
  ),
  :denier_total => 3,
  :name => 'Visite du roi',
  :event => Events::WinDenier.new(
    :num => 2,
    :color => Color.new(:red),
    :building => true,
    :people => true,
    :citizen => true
  )
})

EventCard.create!({
  :cost => Cost.new(
    :citizen => 1,
    :color => Color.new(:yellow),
    :denier => 1
  ),
  :denier_total => 4,
  :name => 'Grande Ducasse',
  :event => Events::WinDenier.new(
    :num => 2,
    :color => Color.new(:yellow),
    :building => true,
    :people => true,
    :citizen => true
  )
})

EventCard.create!({
  :cost => Cost.new(
    :citizen => 1,
    :color => Color.new(:white),
    :denier => 1
  ),
  :denier_total => 2,
  :name => 'Procession',
  :event => Events::WinDenier.new(
    :num => 2,
    :color => Color.new(:white),
    :building => true,
    :people => true,
    :citizen => true
  )
})

EventCard.create!({
  :cost => Cost.new(
    :citizen => 1,
    :color => Color.new(:red),
    :denier => 1
  ),
  :denier_total => 3,
  :name => 'Guillaume le conquérant',
  :event => Events::LostNeighborhood.new(
    :num => 1,
    :color => Color.new(:red),
    :building => true,
    :people => true,
  )
})
