##
#
class Actions::CollectCitizen < Action

  field :on_place, :type => Boolean, :default => false
  field :on_neighborhood, :type => Boolean, :default => false

end
