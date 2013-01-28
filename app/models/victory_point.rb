class VictoryPoint

  include Mongoid::Document

  field :own, :type => Integer
  field :other, :type => Integer
  field :condition, :type => String

  validates :condition,
    inclusion: {
    in: [
      'triple_neighborhood_color',
      'triple_citizen_color',

      'yellow_citizen',
      'white_citizen',
      'red_citizen',

      'yellow_building_people',
      'red_building_people',
      'white_building_people',

      'grey_people',
      'by_4_denier',
      'own',
      'grey_prestige',
      'bulwark_card',
      'white_or_red_building',
    ]
  }


end
