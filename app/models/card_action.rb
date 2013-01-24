require 'virtus'
require 'equalizer'

class CardAction
  include Virtus
  include ::Equalizer.new(:color_effect, :second_color_effect, :around, :in_activate,
                         :in_place, :on_people, :on_building, :win, :denier)

  attribute :color_effect, Color
  attribute :second_color_effect, Color
  attribute :action, String

  attribute :around, Boolean, :default => false

  attribute :in_activate, Boolean, :default => false
  attribute :in_place, Boolean, :default => false

  attribute :on_people, Boolean, :default => false
  attribute :on_building, Boolean, :default => false
  attribute :on_prestige, Boolean, :default => false

  attribute :win, Boolean, :default => false

  attribute :denier, Integer, :default => 0
  attribute :cost, Boolean, :default => false

  attribute :copy_action_not_activate, Boolean, :default => false
  attribute :get_back_citizen_in_place, Boolean, :default => false
  attribute :get_one_card_on, Integer, :default => 0
  attribute :get_two_card_on, Integer, :default => 0
  attribute :get_new_citizen, Boolean, :default => false
  attribute :on_empty_neighborhood, Boolean, :default => false
  attribute :twice_activate, Boolean, :default => false
  attribute :against_event_fill, Integer, :default => 0
  attribute :get_event_denier, Boolean, :default => false

  def mongoize
    {
      :color_effect => color_effect ? color_effect.color : nil ,
      :second_color_effect => second_color_effect ? second_color_effect.color : nil,
      :around => around,
      :in_activate => in_activate,
      :in_place => in_place,
      :on_people => on_people,
      :on_building => on_building,
      :on_prestige => on_prestige,
      :win => win,
      :denier => denier,
      :cost => cost,
      :copy_action_not_activate => copy_action_not_activate,
      :get_back_citizen_in_place => get_back_citizen_in_place,
      :get_one_card_on => get_one_card_on,
      :get_two_card_on => get_two_card_on,
      :get_new_citizen => get_new_citizen,
      :on_empty_neighborhood => on_empty_neighborhood,
      :twice_activate => twice_activate,
      :against_event_fill => against_event_fill,
      :get_event_denier => get_event_denier
    }
  end

  def color=(col)
    case col
    when Integer
      @color = Color.new(col)
    else
      super(col)
    end
  end

  class << self

    def mongoize(object)
      case object
      when self
        object.mongoize
      else
        object
      end
    end

    def demongoize(object)
      self.new(object)
    end

    def evolve(object)
      case object
      when self
        object.mongoize
      else
        object
      end
    end

  end

end
