require 'virtus'
require 'equalizer'

class CardAction
  include Virtus
  include ::Equalizer.new(:effect, :color_effect, :around)

  attribute :effect, String
  attribute :color_effect, String
  attribute :around, Boolean

  def mongoize
    attributes
  end

  class << self

    def mongoize(object)
      case object
      when self
        object.mongoize
      else
        self.new(object)
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
