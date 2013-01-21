require 'virtus'
require 'equalizer'

class CardAction
  include Virtus
  include ::Equalizer.new(:color_effect, :around, :in_activate,
                         :in_place, :on_people, :on_building, :win, :denier)

  attribute :color_effect, Color
  attribute :around, Boolean
  attribute :in_activate, Boolean, :default => false
  attribute :in_place, Boolean, :default => false
  attribute :on_people, Boolean, :default => false
  attribute :on_building, Boolean, :default => false
  attribute :win, Boolean, :default => false
  attribute :denier, Integer, :default => 0
  attribute :cost, Boolean, :default => false
  attribute :buy, String

  def mongoize
    {
      :color_effect => color_effect.color,
      :around => around,
      :in_activate => in_activate,
      :in_place => in_place,
      :on_people => on_people,
      :on_building => on_building,
      :win => win,
      :denier => denier,
      :cost => cost,
      :buy => buy
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
