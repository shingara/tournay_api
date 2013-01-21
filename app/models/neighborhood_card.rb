class NeighborhoodCard
  include Mongoid::Document

  field :color, :type => Color
  field :victory_point, :type => Integer
  field :cost, :type => Integer
  field :level, :type => Integer
  field :name, :type => String
  field :action, :type => CardAction
  field :card_type, :type => String

  def people?
    card_type == 'people'
  end

end
