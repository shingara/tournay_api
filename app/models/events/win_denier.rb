class Events::WinDenier < Event
  field :num, :type => Integer
  field :color, :type => Color
  field :building, :type => Boolean, :default => false
  field :people, :type => Boolean, :default => false
  field :citizen, :type => Boolean, :default => false
end
