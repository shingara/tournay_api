class GameStatus
  include Mongoid::Document

  field :state, :type => String
  field :num, :type => Integer


  class << self
    ##
    # List of all state allow in this GameStatus
    def allow_state
      ['waiting_player']
    end
  end
  validates_inclusion_of :state, :in => GameStatus.allow_state

  def translate
    I18n.t(state, :scope => 'game_status.state', :count => num)
  end

end
