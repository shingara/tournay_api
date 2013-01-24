class When::InPlaceAround < When

  field :building, :type => Boolean, :default => false
  field :prestige, :type => Boolean, :default => false
  field :people, :type => Boolean, :default => false

  # TODO : extract in embeds_many
  field :colors, :type => Array, :default => []
end
