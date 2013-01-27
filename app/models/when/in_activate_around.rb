class When::InActivateAround < When

  field :building, :type => Boolean, :default => false
  field :prestige, :type => Boolean, :default => false
  field :people, :type => Boolean, :default => false

  # TODO : extract in embeds_many
  field :colors, :type => Array, :default => []

  ##
  # Associate color
  #
  def color=(co)
    self.colors = [co]
  end

  ##
  # Return list of Colors
  #
  def colors
    super.map{|c|
      Color.new(c)
    }
  end
end
