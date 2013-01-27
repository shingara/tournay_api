class VictoryPoint

  include Mongoid::Document

  field :own, :type => Integer
  field :other, :type => Integer
  field :condition, :type => String

  validates :condition,
    inclusion: {
    in: [
      'triple_neighborhood_color',
      'yellow_citizen'
    ]
  }


end
