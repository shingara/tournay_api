require 'virtus'
require 'equalizer'

class Color

  include Equalizer.new(:color)

  def initialize(color)
    @color = color
  end
  attr_reader :color

  def mongoize
    @color.to_i
  end

  class << self

    def mongoize(object)
      case object
      when Color
        object.mongoize
      else
        Color.new(object)
      end
    end

    def demongoize(object)
      Color.new(object)
    end

    def evolve(object)
      case object
      when Color
        object.mongoize
      else
        object
      end
    end

  end

end
