require 'virtus'
require 'equalizer'
require 'adamantium'

class Color

  include Equalizer.new(:color)
  include Adamantium

  def initialize(color)
    case color
    when Integer
      @color = color
    when Symbol
      @color = from_sym(color)
    end
  end
  attr_reader :color

  def mongoize
    @color.to_i
  end

  def red?
    @color == 2
  end

  def yellow?
    @color == 1
  end

  def white?
    @color == 3
  end

  def grey?
    @color == 4
  end

  def from_sym(color)
    case color
    when :red
      2
    when :yellow
      1
    when :white
      3
    when :grey
      4
    end
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
