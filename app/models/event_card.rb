class EventCard

  include Mongoid::Document

  field :name, :type => String

  field :denier_total, :type => Integer

  embeds_one :cost

end
