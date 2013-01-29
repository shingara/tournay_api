class Events::LostNeighborhood < Event
  field :num, :type => Integer
  field :color, :type => Color
  field :building, :type => Boolean
  field :people, :type => Boolean
end
