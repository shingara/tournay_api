require 'state_machine'

class Crieur
  include Mongoid::Document

  field :color, :type => Color
  field :level, :type => Integer

  embedded_in :game

  state_machine :state, :action => nil, :initial => :in_deck do
    state :in_deck
    state :out
  end

end
