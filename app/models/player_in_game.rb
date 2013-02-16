class PlayerInGame
  include Mongoid::Document

  field :name, :type => String
  field :denier, :type => Integer
  field :external_id
  field :point, :type => Integer

  embedded_in :game
  embeds_many :citizens
  embeds_many :neighborhood_cards, :class_name => "NeighborhoodCardInGame"
  embeds_many :event_cards, :class_name => 'EventCardInGame'

  def event_cards_in_hand
    event_cards.where(:play => false)
  end

  def neighborhood_cards_in_hand
    neighborhood_cards.where(:play => false)
  end

  def event_cards_in_place
    event_cards.where(:play => true)
  end

  def neighborhood_cards_in_place
    neighborhood_cards.where(:play => true)
  end

  ##
  # The number of citizen not engaged in color pass in args
  #
  # @example
  #   player_in_game.citizens_ready_in(Color.new(:white))
  #
  # @param [ Color ] color the color of citizens we search
  # @return [ Integer ] the number of citizen ready in this color
  #
  # @api public
  #
  def citizens_ready_in(color)
    citizens.where(:color => color, :engaged => false).count
  end


  ##
  # Engaged citizen of color and in number pass in args
  #
  # @param [ Color ] color the color
  # @param [ Integer ] num the number of citizens we engaged
  #
  def engaged_citizens(color, num)
    citizens.where(:color => color).limit(num).update_all(:engaged => true)
  end

end
