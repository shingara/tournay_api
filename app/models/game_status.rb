class GameStatus
  include Mongoid::Document

  field :state, :type => String
  field :num, :type => Integer


  class << self
    ##
    # List of all state allow in this GameStatus
    def allow_state
      ['waiting_new_player', 'waiting_player']
    end
  end
  validates_inclusion_of :state, :in => GameStatus.allow_state

  def translate
    I18n.t(state, :scope => 'game_status.state', :count => num)
  end

  def waiting_player!
    self.state = 'waiting_player'
  end

  def waiting_player?
    self.state == 'waiting_player'
  end

  def waiting_new_player?
    self.state == 'waiting_new_player'
  end

end
