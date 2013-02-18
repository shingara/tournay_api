class PlayerInGame
  include Mongoid::Document

  field :name, :type => String
  field :denier, :type => Integer
  field :external_id
  field :point, :type => Integer

  embedded_in :game
  embeds_many :citizens

  def event_cards_in_hand
    game.event_cards_in_game.where(:player_in_game_id => self.id)
  end

  def neighborhood_cards_in_hand
    game.neighborhood_cards_in_game.where(:player_in_game_id => self.id, :state => 'in_player_hand')
  end

  def event_cards_in_place
    game.event_cards_in_game.where(:player_in_game_id => self.id, :state => 'in_place')
  end

  def neighborhood_cards_in_place
    game.neighborhood_cards_in_game.where(:player_in_game_id => self.id, :state => 'in_place')
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
