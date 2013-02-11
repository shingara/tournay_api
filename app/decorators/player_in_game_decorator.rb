require 'draper'

class PlayerInGameDecorator < Draper::Decorator

  delegate :external_id, :name, :denier

  def hand_cards
    {
      'events' => model.event_cards_in_hand,
      'neighborhood' => model.neighborhood_cards_in_hand,
    }
  end

  def place_cards
    {
      'events' => model.event_cards_in_place,
      'neighborhood' => model.neighborhood_cards_in_place,
    }
  end

  def citizens
    {
      'waiting' => {'red' => 0, 'yellow' => 0, 'white' => 0},
      'played' => {'red' => 0, 'yellow' => 0, 'white' => 0}
    }.tap {|citizens|
      model.citizens.each do |citizen|
        if citizen.engaged
          citizens['played'][citizen.color.translate] += 1
        else
          citizens['waiting'][citizen.color.translate] += 1
        end
      end
    }
  end

end
