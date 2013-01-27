class NeighborhoodCard
  include Mongoid::Document

  field :name, :type => String
  field :color, :type => Color
  field :card_type, :type => String

  field :victory_point, :type => Integer
  field :cost, :type => Integer
  field :level, :type => Integer

  embeds_one :action
  embeds_one :when
  embeds_one :condition_victory_point, :class_name => 'VictoryPoint'


  def people?
    card_type == 'people'
  end

end
